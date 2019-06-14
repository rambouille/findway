class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  DAYS = { 1 => 'lundi', 2 => 'mardi', 3 => 'mercredi', 4 => 'jeudi',
           5 => 'vendredi', 6 => 'samedi', 7 => 'dimanche' }

  MONTHS = { 1 => 'janvier', 2 => 'février', 3 => 'mars', 4 => 'avril', 5 => 'mai',
             6 => 'juin', 7 => 'juillet', 8 => 'août', 9 => 'septembre',
             10 => 'octobre', 11 =>  'novembre', 12 => 'décembre' }
end
