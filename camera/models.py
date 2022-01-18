from django.db import models
from django.utils import timezone
from django.template.defaultfilters import slugify

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
    soort = models.IntegerField(choices=Soorten.choices,default=0)
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

class Bedrijf(models.Model):
    naam = models.CharField(max_length=50,blank = False)
    adres = models.CharField(max_length=50,blank = True)
    postcode = models.CharField(max_length=6,blank = True)
    plaats = models.CharField(max_length=50,blank = True)
    land = models.CharField(max_length=50,default='Nederland',blank = False)
    email = models.EmailField(default='info@bedrijf.nl',max_length=254,blank = False)
    website = models.URLField(max_length=200,blank=True)
    image =  models.ImageField(upload_to ='images/',null=True,blank=True)
    telefoon = models.CharField(max_length=16,blank = True)
    contact =  models.ForeignKey(Gebruiker,on_delete=models.CASCADE)
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

class Wijk(models.Model):
    naam = models.CharField(max_length=50,blank = False)
    plaats = models.CharField(max_length=50,blank = True)
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
        super(Wijk, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = 'wijk'
        ordering = ['naam']

    def __str__(self): # For Python 2, use __unicode__ too
        return self.naam

class Camera(models.Model):
    naam = models.CharField(max_length=50,blank = False,unique=True)
    locatie = models.CharField(max_length=50,blank = False,default='locatie')
    type = models.CharField(max_length=50,blank = False,unique=False)
    bedrijf = models.ForeignKey(Bedrijf,on_delete=models.CASCADE)
    wijk = models.ForeignKey(Wijk,on_delete=models.CASCADE)
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
        unique_together = ('naam','bedrijf','wijk')

    def __str__(self): # For Python 2, use __unicode__ too
        return self.naam
     
class Video(models.Model):
    naam = models.CharField(max_length=50,blank = False,unique=True) #format bedrijflocatieddmmyyhhmmss  (utc)
    opname_van = models.DateTimeField(default=timezone.now, blank=False)
    opname_tot = models.DateTimeField(default=timezone.now, blank=False)
    camera = models.ForeignKey(Camera,on_delete=models.CASCADE)
    video_image = models.ImageField(upload_to ='images/',null=True,blank=True)
    video_link= models.CharField(max_length=500,blank=True)
    # video_link= models.URLField(max_length=500,blank=True)
    codec = models.CharField(max_length=50,blank = True)
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
        ordering = ['naam','codec']
        unique_together = ('naam','codec')

    def __str__(self): # For Python 2, use __unicode__ too
        return self.naam

