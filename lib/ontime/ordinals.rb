class Fixnum
  ORDINALS = %i{ st nd rd th }

  ORDINALS.each do |ordinal|
    unless respond_to?(ordinal)
      class_eval("def #{ordinal}; self; end")
    end
  end

  unless respond_to?(:seconds)
    def seconds
      self
    end
  end
end
