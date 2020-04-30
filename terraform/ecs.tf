data "template_file" "portfolio-task-definition-template" {
  template = file("templates/portfolio.json.tpl")
  vars = {
    REPOSITORY_URL = "${var.account}.dkr.ecr.${var.region}.amazonaws.com/${var.project}"
    container_name           = var.project
    docker_image             = "${var.account}.dkr.ecr.${var.region}.amazonaws.com/${var.project}:1"
    aws_account_id           = var.account
    aws_region               = var.region
    microservice_port        = var.project_port
  }
}

resource "aws_ecs_cluster" "portfolio-cluster" {
  name = "portfolio-cluster"
}

resource "aws_ecs_task_definition" "portfolio-task-definition" {
  container_definitions = data.template_file.portfolio-task-definition-template.rendered
  family = var.project

  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  requires_compatibilities = ["FARGATE"]
  depends_on = [
    "aws_iam_role_policy_attachment.ecs-policy-attach"
  ]
  execution_role_arn = aws_iam_role.ecs_execution_role.arn
}

resource "aws_ecs_service" "portfolio-service" {
  name = var.project
  cluster = aws_ecs_cluster.portfolio-cluster.id
  task_definition = aws_ecs_task_definition.portfolio-task-definition.arn
  desired_count = 1
  iam_role = aws_iam_role.ecs-service-role.arn
  depends_on = ["aws_iam_policy_attachment.ecs-service-attach1"]
  launch_type = "FARGATE"

  load_balancer {
    elb_name = aws_elb.portfolio-elb.name
    container_name = var.project
    container_port = 8000
  }
}