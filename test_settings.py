from skeleton.settings import *


DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.spatialite',
        'NAME': 'skeleton',
        'USER': '',
        'PASSWORD': '',
        'HOST': '',
        'PORT': '',
    }
}