Rails.application.routes.draw do

  self.get("/forex", {:controller => "currency", :action => "first_currency"})
  self.get("/forex/:from_currency", {:controller => "currency", :action => "second_currency"})
  self.get("/forex/:from_currency/:to_currency", {:controller => "currency", :action => "third_currency"})
  # self.get("/covid", {:controller => "application", :action => "add"})
  # self.get("/covid/AK", {:controller => "application", :action => "wizard_add"})
end
