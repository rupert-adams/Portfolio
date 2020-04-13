from site_app.models import Enquiry
from site_app.models import Projects
from rest_framework import viewsets, permissions
from .serializers import EnquirySerializer
from .serializers import ProjectSerializer


class EnquiryViewSet(viewsets.ModelViewSet):
    queryset = Enquiry.objects.all()
    permission_classes = [
        permissions.AllowAny
    ]
    serializer_class = EnquirySerializer


class ProjectViewSet(viewsets.ModelViewSet):
    queryset = Projects.objects.all()
    permission_classes = [
        permissions.AllowAny
    ]
    serializer_class = ProjectSerializer
