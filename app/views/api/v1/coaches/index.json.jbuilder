json.array! @coaches do |coach|
  json.extract! coach, :id, :firstname, :lastname, :email, :description, :age, :status, :linkedin, :speciality, :business_expertise, :hourly_price_cents, :skype_username, :hangout_username, :facetime_username, :avatar, :video
end
