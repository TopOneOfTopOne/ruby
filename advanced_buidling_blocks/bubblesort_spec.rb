require_relative 'bubblesort'

describe '#bubblesort' do
  context 'empty array' do
    subject {bubblesort([])}
    it {is_expected.to eq([])}
  end

  context '1 element array' do
    subject {bubblesort([1])}
    it {is_expected.to eq([1])}
  end

  context '2 element array' do
    context 'unsorted' do
      subject {bubblesort([2,1])}
      it {is_expected.to eq([1,2])}
      end
    context 'sorted' do
      subject {bubblesort([1,2])}
      it {is_expected.to eq([1,2])}
    end
  end

  context '10 element array' do
    context 'unsorted' do
      subject {bubblesort([1,4,3,2,5,6,7,8,9,10])}
      it {is_expected.to eq([1,2,3,4,5,6,7,8,9,10])}
    end
    context 'sorted' do
      subject {bubblesort([1,2,3,4,5,6,7,8,9,10])}
      it {is_expected.to eq([1,2,3,4,5,6,7,8,9,10])}
    end
  end
end