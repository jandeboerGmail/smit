from camera.models import Log, Parameter

#@login_required

def addLogEntry(orderNr,message):
    aLog = Log()
    aLog.message = orderNr
    aLog.ordernr = message
    aLog.save()
    
    return