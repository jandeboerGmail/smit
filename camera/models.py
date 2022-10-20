from curses import def_shell_mode
from django.db import models
from django.utils import timezone
from django.template.defaultfilters import slugify

class Adress (models.Model):
    naam = models.CharField(max_length=50,blank = False)
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
    website = models.URLField(max_length=200,blank=True,default="www.bedrijf.nl")
    image =  models.ImageField(upload_to ='images/',null=True,blank=True)
    telefoon = models.CharField(max_length=16,blank = True,default="000 1234567")
    #contact =  models.ForeignKey(Gebruiker,on_delete=models.CASCADE)
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

class Gebruiker(models.Model):

    class Soorten(models.IntegerChoices):
            admin = 0
            contact = 1
            wijkbeheerder = 2
    
    user = models.CharField(max_length=50,blank = False)
    password = models.CharField(max_length=50,blank = False)
    # bedrijf = models.ForeignKey(Bedrijf,on_delete=models.CASCADE)
    naam = models.CharField(max_length=50,blank = False)
    email = models.EmailField(default='info@me.nl',max_length=254,blank = False)
    telefoon = models.CharField(default = '06 11 22 33 44',max_length=16,blank = False)
    soort = models.IntegerField(choices=Soorten.choices,default=1)
    memo = models.TextField(blank = True)
    slug = models.SlugField(max_length=120,default='slug')
    datum_inserted = models.DateTimeField(default=timezone.now, blank=False)
    datum_updated = models.DateTimeField(default=timezone.now, blank=False)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.naam)
        self.datum_updated = timezone.now()
        super(Gebruiker, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = 'gebruiker'
        ordering = ['naam']

    def __str__(self): # For Python 2, use __unicode__ too
        return self.naam

class Locatie(models.Model):
    naam = models.CharField(max_length=50,blank = False)
    adres = models.ForeignKey(Adress,on_delete=models.CASCADE)
    image =  models.ImageField(upload_to ='images/',null=True,blank=True)
    bedrijf = models.ForeignKey(Bedrijf,on_delete=models.CASCADE)
    contact =  models.ForeignKey(Gebruiker,on_delete=models.CASCADE)
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
    naam  = models.CharField(max_length=50,blank = False,unique=True)
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
     
class Video(models.Model):
    naam = models.CharField(max_length=100,blank = False,unique=True) #format bedrijflocatieddmmyyhhmmss  (utc)
    ordernr = models.CharField(max_length=50,blank = False,unique=False,default="")
    opname_van = models.DateTimeField(default=timezone.now, blank=False)
    opname_tot = models.DateTimeField(default=timezone.now, blank=False)
    camera = models.ForeignKey(Camera,on_delete=models.CASCADE)
    #video_image = models.ImageField(upload_to ='images/',null=True,blank=True)
    video_link= models.CharField(max_length=500,blank=True)
    # video_link= models.URLField(max_length=500,blank=True)
    duration = models.CharField(max_length=10,blank = True)
    codec = models.CharField(max_length=50,blank = True,default='vb9')
    memo = models.TextField(blank = True)
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
    conversion_running = models.BooleanField(default=False)
    datum_inserted = models.DateTimeField(default=timezone.now, blank=False)
    datum_updated = models.DateTimeField(default=timezone.now, blank=False)

    class Meta:
        verbose_name_plural = 'parameter'
        ordering = ['id']

    def __str__(self): # For Python 2, use __unicode__ too
        return self.videoPath