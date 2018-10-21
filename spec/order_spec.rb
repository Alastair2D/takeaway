require 'order'

describe Order do 
  subject(:order) { Order.new(menu) }
  let(:menu) { instance_double Menu, dishes: [pie, mash, peas] } 
  let(:pie) { instance_double Dish, name: 'pie', price: 3 }
  let(:mash) { instance_double Dish, name: 'mash', price: 2 }
  let(:peas) { instance_double Dish, name: 'peas', price: 1 }
  let(:dish_off_menu) { instance_double Dish, name: 'not on menu', price: 0 }

  describe '#initialize' do 
    it 'defaults with an empty basket' do 
      expect(subject.basket).to be_empty
    end
  end

  describe '#add' do 
    it 'adds dishes to @basket that are on the @menu' do 
      subject.add(pie)
      expect(subject.basket).to eq [{dish: pie, amount: 1}] 
    end  
    it 'adds multiple dishes if amount varies' do 
      subject.add(pie, 3)
      expect(subject.basket).to eq [{dish: pie, amount: 3}]
    end
  end

  describe '#clear_basket' do 
    it 'empties @basket' do 
      subject.add(pie, 3)
      expect(subject.clear_basket).to be_empty
    end
  end

  describe '#list_basket' do 
    it 'prints dishes with amount in @basket' do 
      subject.add(pie, 5)
      order_list = "5 x pie\n"
      expect { subject.list_basket }.to output(order_list).to_stdout
    end
  end

  describe '#total' do 
    it 'should return the total cost for a full order' do 
      subject.add(pie, 2)
      subject.add(mash, 2)
      subject.add(peas, 2)
      expect(subject.total).to eq 12
    end
  end

  
end
