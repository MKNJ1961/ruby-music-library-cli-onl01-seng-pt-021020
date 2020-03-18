module Concerns::Findable

  def find_by_name(name)
    all.find{ |x| x.name == name}
  end
