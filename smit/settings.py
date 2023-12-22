"""
Django settings for smit project.

Generated by 'django-admin startproject' using Django 3.1.3.

For more information on this file, see
https://docs.djangoproject.com/en/3.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.1/ref/settings/
"""

from pathlib import Path
import os

# Build paths inside the project like this: BASE_DIR / 'subdir'.
#BASE_DIR = Path(__file__).resolve().parent.parent
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = os.environ.get('DJANGO_SECRET_KEY')

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = bool(int(os.environ.get('DJANGO_DEBUG', 0)))

ALLOWED_HOSTS = ['127.0.0.1','localhost','192.168.1.10']
ALLOWED_HOSTS.extend(
    filter(
        None,
        os.environ.get('DJANGO_ALLOWED_HOSTS', '').split(','),
   )
)

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    #'camera.apps.AccountConfig',
    'camera',

    #mfa
    'django_otp',
    'django_otp.plugins.otp_static',
    'django_otp.plugins.otp_totp',
    'django_otp.plugins.otp_email',  # <- if you want email capability.
    'two_factor',
    'two_factor.plugins.phonenumber',  # <- if you want phone number capability.
    'two_factor.plugins.email',  # <- if you want email capability.
    'bootstrapform'
     
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django_otp.middleware.OTPMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'smit.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'smit.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.1/ref/settings/#databases

DEFAULT_AUTO_FIELD = 'django.db.models.AutoField'


DATABASES = {
     'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': os.environ.get('DB_NAME'),
        'USER': os.environ.get('DB_USER'),
        'PASSWORD': os.environ.get('DB_PASS'),
        'HOST': os.environ.get('DB_HOST'), 
        'PORT': os.environ.get('DB_PORT'),
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
            },
    }
}

# Password validation
# https://docs.djangoproject.com/en/3.1/ref/settings/#auth-password-validaton

#LOGIN / LOGOUT
#LOGIN_URL = '/admin/login'
#LOGOUT_REDIRECT_URL = 'about'
#LOGIN_URL = 'two_factor:login' 
# this one is optional
#LOGIN_REDIRECT_URL = 'two_factor:profile'

#LOGIN_URL = 'home' 
#LOGIN_URL = "login"
LOGIN_REDIRECT_URL = "indexVideo"
#LOGIN_REDIRECT_URL = "allowedVideo"
LOGOUT_REDIRECT_URL = "login"

# Develop
#TWO_FACTOR_CALL_GATEWAY = 'two_factor.gateways.fake.Fake' 
#TWO_FACTOR_SMS_GATEWAY =  'two_factor.gateways.fake.Fake'

# Prod
TWO_FACTOR_CALL_GATEWAY = 'two_factor.gateways.twilio.gateway.Twilio' 
TWO_FACTOR_SMS_GATEWAY = 'two_factor.gateways.twilio.gateway.Twilio'

PHONENUMBER_DEFAULT_REGION = 'NL'
TWO_FACTOR_WEBAUTHN_RP_NAME = 'Smit Video App'

TWILIO_ACCOUNT_SID =  os.environ.get('TWILIO_ACCOUNT_SID')
TWILIO_AUTH_TOKEN  =  os.environ.get('TWILIO_AUTH_TOKEN')
TWILIO_CALLER_ID   =  os.environ.get('TWILIO_CALLER_ID')

#mail
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
# EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend' No mail only diplay on screen

EMAIL_HOST          = os.environ.get('EMAIL_HOST') 
EMAIL_PORT          = os.environ.get('EMAIL_PORT') 
EMAIL_HOST_USER     = os.environ.get('EMAIL_HOST_USER')
EMAIL_HOST_PASSWORD = os.environ.get('EMAIL_HOST_PASSWORD')
EMAIL_USE_TLS       = True
DEFAULT_FROM_EMAIL  = os.environ.get('DEFAULT_FROM_EMAIL') 
ACME_DEFAULT_EMAIL  = os.environ.get('ACME_DEFAULT_EMAIL ') 

DOMAIN              = os.environ.get('DOMAIN')

#MFA
#TWO_FACTOR_REMEMBER_COOKIE_AGE =  None # 300
#TWO_FACTOR_LOGIN_TIMEOUT=60

#Cookie settings 
#SESSION_EXPIRE_AT_BROWSER_CLOSE=True
#SESSION_COOKIE_AGE=3600
#SESSION_COOKIE_AGE  = int(os.environ.get('SESSION_COOKIE_AGE','3600'))
#SESSION_COOKIE_SECURE=True
#PASSWORD_RESET_TIMEOUT_DAYS=30

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

#AUTH_USER_MODEL = 'camera.Gebruiker'

# Internationalization
# https://docs.djangoproject.com/en/3.1/topics/i18n/

LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'CET'
USE_I18N = True
USE_L10N = True
USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.2/howto/static-files/

STATIC_URL = '/static/static/'
STATIC_ROOT = '/vol/web/static'

#MEDIA_ROOT = '/vol/web/media'
MEDIA_ROOT = os.path.join(BASE_DIR,'media')
#MEDIA_ROOT = '/home/jan/media/'
MEDIA_URL = '/media/'
#MEDIA_ROOT = BASE_DIR / 'media'

CRISPY_TEMPLATE_PACK = 'bootstrap5'
SECURE_CROSS_ORIGIN_OPENER_POLICY = None


