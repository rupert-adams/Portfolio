from rest_framework import routers
from .api import EnquiryViewSet, ProjectViewSet

router = routers.DefaultRouter()
router.register('api/enquiry', EnquiryViewSet, 'enquires')
router.register('api/projects', ProjectViewSet, 'projects')

urlpatterns = router.urls
