require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
end

def second_supply_for_fourth_of_july(holiday_supplies)
  holiday_supplies[:summer][:fourth_of_july][1]
end

second_supply_for_fourth_of_july(holiday_supplies)


# Learn.co Textbook solution
def add_supply_to_winter_holidays(holiday_hash, item)
 holiday_hash[:winter].each do |holiday, decorations|
   decorations << item
  end
end

# My alternative
def add_supply_to_winter_holidays(holiday_hash, item)
 holiday_hash[:winter].each do |holiday, decorations|
   decorations.push(item)
  end
end


add_supply_to_winter_holidays(holiday_supplies, "Baloons")

# This will not word because the sub-hashes are not somple array-string values
#def add_supply_to_winter_holidays(holiday_hash, supply)
#  holiday_hash.each do |season, holiday|
#    holiday.each do |holiday, supplies|
#      if holiday == :winter
#        supplies.push{supply}
#      end
#    end
#  end
#end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day].push(supply)
end

add_supply_to_memorial_day(holiday_supplies, "baloons")

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code h
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

add_new_holiday_with_supplies(holiday_supplies, :fall, :succas, ["lulav", "esrog", "schach"])

def add_new_season_and_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season] = {holiday_name => supply_array} # the new echelon being created is to the left of the equals sign.
  holiday_hash
end

mitzvos = ["seder", "matzah", "hagaddah"]
add_new_season_and_holiday_with_supplies(holiday_supplies, :aviv, :pesach, mitzvos)


def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end


def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do | season, holiday|
     puts "#{season.capitalize}:"
     holiday.each do |holiday, item|
       puts "  #{holiday.to_s.split("_").map {|i| i.capitalize}.join(" ")}: #{item.join(", ")}"
     end
  end 
end

def all_holidays_with_bbq(holiday_hash)
  holiday_hash.map do |season, holiday|
    holiday.map do |holiday, item|
      holiday if item.include?("BBQ")
    end 
  end.flatten.compact
end
