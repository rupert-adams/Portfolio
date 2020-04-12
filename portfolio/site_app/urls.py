from rest_framework import routers
from .api import EnquiryViewSet

router = routers.DefaultRouter()
router.register('api/enquiry', EnquiryViewSet, 'enquires')

urlpatterns = router.urls
