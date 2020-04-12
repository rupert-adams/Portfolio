from site_app.models import Enquiry
from rest_framework import viewsets, permissions
from .serializers import EnquirySerializer


class EnquiryViewSet(viewsets.ModelViewSet):
    queryset = Enquiry.objects.all()
    permission_classes = [
        permissions.AllowAny
    ]
    serializer_class = EnquirySerializer
