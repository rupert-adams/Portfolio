[
  {
    "name": "portfolio",
    "image": "751533301915.dkr.ecr.eu-west-1.amazonaws.com/portfolio:1",
    "command": [
        "bash -c 'npm run dev && pipenv run portfolio/manage.py migrate && pipenv run portfolio/manage.py runserver 0.0.0.0:8000'"
    ],
    "entryPoint": [
        "sh",
        "-c"
    ],
    "cpu": 256,
    "memory": 512,
    "workingDirectory": "/app",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 8000,
        "hostPort": 8000
      }
    ]
  }
]