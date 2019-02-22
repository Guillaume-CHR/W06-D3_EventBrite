class EventMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def attendance_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @admin =  User.find(Event.find(attendance.event_id).admin_id)
    @guest =  User.find(attendance.guest_id)
    @event = Event.find(attendance.event_id)

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'Someone has signed to your event') 
  end
end
