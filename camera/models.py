from curses import def_shell_mode
from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from django.template.defaultfilters import slugify
from django.conf import settings
from datetime import timedelta

def in_a_year():
    return timezone.now() + timedelta(days=365)

class Adress (models.Model):
    naam = models.CharField(max_length=100,blank = False)
    straat = models.CharField(max_length=50,blank = False,default = 'Straatnaam 1')
    postcode = models.CharField(max_length=6,blank = False,default = '0000AA')
    plaats = models.CharField(max_length=50,blank = False,default = 'Plaats')
    land = models.CharField(max_length=50,default='Nederland',blank = False)
    memo = models.TextField(blank = True)
    slug = models.SlugField(max_length=120,default='slug')
    datum_inserted = models.DateTimeField(default=timezone.now, blank=False)
    datum_updated = models.DateTimeField(default=timezone.now, blank=False)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.naam)
        self.datum_updated = timezone.now()
        super(Adress, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = 'adress'
        ordering = ['naam']

    def __str__(self): # For Python 2, use __unicode__ too
        return self.naam

class Bedrijf(models.Model):
    naam = models.CharField(max_length=50,blank = False)
    adres = models.ForeignKey(Adress,on_delete=models.CASCADE)
    email = models.EmailField(default='info@bedrijf.nl',max_length=254,blank = False)
    website = models.URLField(max_length=200,blank=True,default="htpp://www.bedrijf.nl/")
    image =  models.ImageField(upload_to ='images/',null=True,blank=True)
    telefoon = models.CharField(max_length=16,blank = True,default="000 1234567")
    #contact =  models.ForeignKey(User,on_delete=models.CASCADE)
    memo = models.TextField(blank = True)
    slug = models.SlugField(max_length=120,default='slug')
    datum_inserted = models.DateTimeField(default=timezone.now, blank=False)
    datum_updated = models.DateTimeField(default=timezone.now, blank =False)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.naam)
        self.datum_updated = timezone.now()
        super(Bedrijf, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = 'bedrijf'
        ordering = ['naam']

    def __str__(self): # For Python 2, use __unicode__ too
        return self.naam

class Gebied(models.Model):
    gebiedNr = models.IntegerField(blank = False, null = False)
    naam = models.CharField(max_length=100,blank = False, default ="onbekend")
    bedrijf = models.ForeignKey(Bedrijf,on_delete=models.CASCADE)
    image = models.ImageField(upload_to ='images/',null=True,blank=True)
    memo = models.TextField(blank = True)
    #slug = models.SlugField(max_length=120,default='slug')
    datum_inserted = models.DateTimeField(default=timezone.now, blank=False)
    datum_updated = models.DateTimeField(default=timezone.now, blank=False)

    def save(self, *args, **kwargs):
        self.datum_updated = timezone.now()
        super(Gebied, self).save(*args, **kwargs)
  
    class Meta:
        verbose_name_plural = 'gebied'
        ordering = ['bedrijf','gebiedNr']
        unique_together = ('bedrijf','gebiedNr')

    def __str__(self): # For Python 2, use __unicode__ too
        return self.naam
    
class Account(models.Model):

    class Soorten(models.IntegerChoices):
            admin = 0
            wijkbeheerder = 1
            contact = 2
               
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    email2 = models.EmailField(default='info2@me.nl',max_length=254,blank = True)
    telefoon_mobiel = models.CharField(default = '06 11 22 33 44',max_length=16,blank = False)
    telefoon_vast = models.CharField(default = '00 11 22 33 44',max_length=16,blank = True)
    soort = models.IntegerField(choices=Soorten.choices,default=2)
    # bedrijf = models.ForeignKey(Bedrijf,on_delete=models.CASCADE)
    gebied  = models.ManyToManyField(Gebied)
   
    def __str__(self): 
        return self.user.username 
    
class Locatie(models.Model):
    naam = models.CharField(max_length=100,blank = False)
    adres = models.ForeignKey(Adress,on_delete=models.CASCADE)
    gebied  = models.ForeignKey(Gebied,on_delete=models.CASCADE)
    image =  models.ImageField(upload_to ='images/',null=True,blank=True)
    bedrijf = models.ForeignKey(Bedrijf,on_delete=models.CASCADE)
    contact =  models.ForeignKey(User,on_delete=models.CASCADE)
    memo = models.TextField(blank = True)
    slug = models.SlugField(max_length=120,default='slug')
    datum_inserted = models.DateTimeField(default=timezone.now, blank=False)
    datum_updated = models.DateTimeField(default=timezone.now, blank =False)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.naam)
        self.datum_updated = timezone.now()
        super(Locatie, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = 'locatie'
        ordering = ['naam']
        unique_together = ('naam','adres')

    def __str__(self): # For Python 2, use __unicode__ too
        return self.naam

class Camera(models.Model):
    naam  = models.CharField(max_length=50,blank = False)
    locatie = models.ForeignKey(Locatie,on_delete=models.CASCADE)
    type = models.CharField(max_length=50,blank = False,unique=False)
    plaats = models.CharField(max_length=50,blank = True,unique=False)
    gps_locatie = models.CharField(max_length=50,blank = True)
    image =  models.ImageField(upload_to ='images/',null=True,blank=True)
    datum_geplaatst = models.DateTimeField(default=timezone.now, blank=False)
    memo = models.TextField(blank = True)
    slug = models.SlugField(max_length=120,default='slug')
    datum_inserted = models.DateTimeField(default=timezone.now, blank=False)
    datum_updated = models.DateTimeField(default=timezone.now, blank=False)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.naam)
        self.datum_updated = timezone.now()
        super(Camera, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = 'camera'
        ordering = ['naam']
        unique_together = ('naam','locatie')

    def __str__(self): # For Python 2, use __unicode__ too
        return self.naam

class ServiceOrder(models.Model):
        # id =  models.AutoField(verbose_name='ID', serialize=False,auto_created=True,primary_key=True)
        ordernr = models.CharField(max_length=50,blank = True,unique=False,default="",verbose_name="Smit intern Serviceorder nummer")
        opdrachtnummer  =  models.CharField(max_length=50,blank = False,unique=False,default="",verbose_name="Klant opdrachtnummer")
        bedrijf = models.ForeignKey(Bedrijf,on_delete=models.CASCADE)
        contact = models.ForeignKey(User,on_delete=models.CASCADE)
        locatie = models.ForeignKey(Locatie,on_delete=models.CASCADE)
        
        #video  = models.ForeignKey(Video,on_delete=models.CASCADE)
        keep_original =  models.BooleanField(default=False,verbose_name="Behoud orgineel")
        auto_cleanup =  models.BooleanField(default=False,verbose_name="Automatisch opruimen")
        conversion_ready =  models.BooleanField(default=False)
        opened_date = models.DateTimeField(blank=False,default=timezone.now,verbose_name="Incidend start datum")
        #opened_time = models.TimeField(blank=False,null=False,verbose_name='"Incidend start tijd')
        closed_date = models.DateTimeField(blank=False,default=timezone.now,verbose_name="Incidend eind datum")
        #closed_time = models.TimeField(blank=False,null=False,verbose_name='Incidend eind tijd')
        memo = models.TextField(blank = True,verbose_name="Omschrijf incident: (Specificeer zo duidelijk mogelijk wanneer in een zo kort mogelijke periode, waar en/of op welke plek het incident heeft plaatsgevonden)")
        slug = models.SlugField(max_length=120,default='slug')
        datum_inserted = models.DateTimeField(default=timezone.now, blank=False)
        datum_updated  = models.DateTimeField(default=timezone.now, blank=False)

        def save(self, *args, **kwargs):
            self.slug = slugify(self.ordernr)
            self.datum_updated = timezone.now()
            super(ServiceOrder, self).save(*args, **kwargs)     

        class Meta:
            verbose_name_plural = 'ServiceOrder'
            ordering = ['ordernr']

        def __str__(self): # For Python 2, use __unicode__ too
            return self.ordernr   
        
class Video(models.Model):
    naam = models.CharField(max_length=100,blank = False) #format bedrijflocatieddmmyyhhmmss  (utc)
    ordernr  = models.ForeignKey(ServiceOrder,on_delete=models.CASCADE)
    ##ordernr = models.CharField(max_length=50,blank = False,unique=False,default="")
    opname_van = models.DateTimeField(default=timezone.now, blank=False)
    opname_tot = models.DateTimeField(default=timezone.now, blank=False)
    camera = models.ForeignKey(Camera,on_delete=models.CASCADE)
    #video_link = models.CharField(max_length=500,blank=True)
    #
    video_link = models.FileField(max_length=500,blank=True)
    #video_image = models.CharField(max_length=500,blank=True)  
    video_image = models.ImageField(max_length=500,null=True,blank=True)
    
    duration = models.CharField(max_length=20,blank = True)
    file_size = models.CharField(max_length=30,blank = False,default = '0')
    codec = models.CharField(max_length=50,blank = True,default='mp4')
    memo = models.TextField(blank = True)
    #conversion_started =  models.BooleanField(default=False)
    conversion_ready   =  models.BooleanField(default=False)
    verwijder_datum = models.DateField(default=in_a_year, blank=False)
    slug = models.SlugField(max_length=120,default='slug')
    datum_inserted = models.DateTimeField(default=timezone.now, blank=False)
    datum_updated = models.DateTimeField(default=timezone.now, blank=False)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.naam)
        self.datum_updated = timezone.now()
        super(Video, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = 'video'
        ordering = ['ordernr','naam','camera','codec']
        unique_together = ('naam','camera')

    def __str__(self): # For Python 2, use __unicode__ too
        return self.naam
   
    
class Log(models.Model):
    id =  models.AutoField(verbose_name='ID', serialize=False,auto_created=True,primary_key=True)
    ordernr = models.CharField(max_length=50,blank = True,unique=False)
    message = models.CharField(max_length=500,blank = False,default="empty")
    datum_inserted = models.DateTimeField(default=timezone.now, blank=False)
    datum_updated = models.DateTimeField(default=timezone.now, blank=False)

    def save(self, *args, **kwargs):
        self.datum_updated = timezone.now()
        super(Log, self).save(*args, **kwargs)
  
    class Meta:
        verbose_name_plural = 'log'
        ordering = ['ordernr']

    def __str__(self): # For Python 2, use __unicode__ too
        return self.id
     
class Parameter(models.Model):
    id =  models.AutoField(verbose_name='ID', serialize=False,auto_created=True,primary_key=True)
    videoPath = models.CharField(max_length=100,blank = False,unique=False) # ex /home/jan/video/'
    maximum_convert = models.IntegerField(blank = False, default=3)
    conversion_order = models.CharField(max_length=100,blank = True, default="Default")
    conversion_running = models.BooleanField(default=False)
    datum_inserted = models.DateTimeField(default=timezone.now, blank=False)
    datum_updated = models.DateTimeField(default=timezone.now, blank=False)

    class Meta:
        verbose_name_plural = 'parameter'
        ordering = ['id']

    def __str__(self): # For Python 2, use __unicode__ too
        return self.videoPath
