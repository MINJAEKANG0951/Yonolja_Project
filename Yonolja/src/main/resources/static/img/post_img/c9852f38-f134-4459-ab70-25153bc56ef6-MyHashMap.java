package ����;

//import ArrayList.ArrayList3;

public class MyHashMap<K, V> implements MyMap<K, V> {

    MyArrayList<Pair<K, V>> list = null;
    
    /**
     * HashMap3 Ŭ������ �������Դϴ�.
     * Ű ������ �ڷḦ �ٷ�� �����Դϴ�. 
     * ���������� ArrayList3 �ν��Ͻ��� �ʱ�ȭ�մϴ�.
     */
    
    /**
     * �� Ŭ������ �迭�� ����� ����� ����Ͽ� ������ HashMap�� �����մϴ�.
     *
     * @since 1.0
     * @author �迵��
     * @see MyArrayList
     * List list = Collections.synchronizedList(new ArrayList(...));
     */
    
    public MyHashMap() {
        list = new MyArrayList<>();
    }

    @Override
    public V get(K key) {
        int i = 0;
        try {
            for (Pair<K, V> x : list) {
                if (x.getKey() == key || x.getKey().equals(key)) {
                    return list.get(i).getValue();
                }
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    @Override
    public V put(K key, V value) {
        Pair<K, V> newPair = new Pair<K, V>(key, value);
        boolean flag=true;
		int i=0;
		int reviceNum=0;
		V result = null;
		for(Pair<K, V> x:list) {
			if(x.getKey()==key||x.getKey().equals(key)) {
				result = x.getValue();
				flag=false;
				reviceNum=i;
			}
			i++;
		}
		if(!flag) {
			list.set(reviceNum,newPair);
			newPair.setKey(key);
			newPair.setValue(value);
			
		}
		if(flag) {
			this.list.add(newPair);
		}
        return result;
    }
    
    public String toString() {
		String result="";
		for(int i=0; i<list.size(); i++) {
			result+=list.get(i).getKey()+"="+list.get(i).getValue();
			if(i==list.size()-1)break;
			result+=", ";
		}
		return "{"+result+"}";
		
	}
    
    @Override
	public V remove(K key) {
    	int i=0;
    	V removeNum=null;
    	for(Pair<K, V> x:list) {
    		if(x.getKey()==key||x.getKey().equals(key)) {
    			removeNum=list.get(i).getValue();
    			list.remove(i);
    			return removeNum;
    		}
    		i++;
    	}
		return null;
	}
    
    private class Pair<K2, V2> {
        private K key;
        private V value;

        Pair(K key, V value) {
            this.key = key;
            this.value = value;
        }

        K getKey() {
            return this.key;
        }

        V getValue() {
            return this.value;
        }

        void setKey(K key) {
            this.key = key;
        }

        void setValue(V value) {
            this.value = value;
        }
    }

	
}