module Enumerable
  def my_each
    for i in 0..(length - 1)
      yield(self[i])
    end
    self
  end

  def my_each_with_index
    for i in 0..(length - 1)
      yield(self[i], i)
    end
    self
  end

  def my_select
    return_val = []
    my_each { |el| return_val << yield(el) }
    return_val.compact
  end

  def my_all?(element = nil)
    if block_given?
      my_each { |el| return false unless yield(el) }
    elsif element.nil?
      my_each { |el| return false unless el }
    else
      my_each { |el| return false if el != element }
    end
    true
  end

  def my_any?(element = nil)
    if block_given?
      my_each { |el| return true if yield(el) }
    elsif element.nil?
      has_true = false
      my_each { |el| has_true = true if el }
      return has_true
    else
      my_each { |el| return true if el == element }
    end
    false
  end

  def my_none?(element = nil)
    if block_given?
      my_each { |el| return false if yield(el) }
    elsif element.nil?
      has_true = false
      my_each { |el| has_true = true if el }
      return false if has_true
    else
      my_each { |el| return false if el == element }
    end
    true
  end

  def my_count(element = nil)
    length = 0
    my_each { |el| length += 1 if yield(el) } if block_given? && element.nil?

    case element
    when false then my_each { |_| length += 1 }
    when true then my_each { |el| length += 1 if el == element }
    end
    length
  end

  def my_map(proc_obj = nil)
    mapped_ary = []
    if proc_obj.is_a?(Proc)
      my_each { |el| mapped_ary << proc_obj.call(el) }
    else
      my_each { |el| mapped_ary << yield(el) }
    end
    mapped_ary
  end

  def my_inject(initial = 0, symbol = nil)
    initial, symbol = check_variables(initial, symbol)
    my_each_with_index do |val, idx|
      next_val = self[idx + 1]
      break if next_val.nil?

      initial += val if idx.zero?
      initial = case block_given?
                when true then yield(initial, next_val)
                when false then symbol.to_proc.call(initial, next_val)
                end
    end
    initial
  end
end

private

def check_variables(initial, symbol)
  return [0, initial] if initial.is_a?(Symbol)

  [initial, symbol]
end
