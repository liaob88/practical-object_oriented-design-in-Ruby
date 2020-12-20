class RevealingReferences
  attr_reader :wheels
  # data = [[1,2], [3,4], [5,6], ...]
  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect { |wheel| wheel.rim + (wheel.tire * 2) }
  end

  # Struct: 明示的にクラスを書かずにいくつもの属性を一箇所に束ねるための便利な方法
  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect { |cell| Wheel.new(cell[0], cell[1]) }
  end
end

# ------
# 変更前コード
# class RevealingReferences
#   attr_reader :data
#   def initialize(data)
#     @data = data
#   end

#   def diameters
#     data.collect { |cell| cell[0] + (cell[1] * 2) }
#   end
# end
# ------

# diameters が data のデータ構造を知っている場合、ここでは配列と知っている場合、配列の構造が変更されると diameters も変更が必要だった。
# しかし、wheelifyメソッドを実装することで diameters はdata のデータ構造を知っている必要がなくなる(配列インデックスによるアクセスの必要性がなくなる)
# 配列の構造が変更されても変更するべきなのは基本的には wheelify のみになり影響範囲を閉じることができる。