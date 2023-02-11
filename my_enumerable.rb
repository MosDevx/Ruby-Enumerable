module MyEnumerable
  def all?(&block)
    if block_given?

      each do |a|
        return false if block.call(a) == false
      end

    else
      each do |obj|
        return false unless obj
      end

    end
    true
  end

  def any?(&block)
    if block_given?

      each do |a|
        return true if block.call(a) == true

        next
      end

    else
      each do |obj|
        return true if obj

        next
      end

    end
    false
  end

  def filter(&block)
    if block_given?
      ans = []

      each do |obj|
        next unless block.call(obj)

        ans.append(obj)
      end

      ans

    else
      each
    end
  end

  def reverse_em
    a = []
    each { |e| a.prepend(e) }
    a
  end
end
