package 과제;

//import ArrayList.ArrayList3;

public class MyHashMap<K, V> implements MyMap<K, V> {

    MyArrayList<Pair<K, V>> list = null;
    
    /**
     * HashMap3 클래스의 생성자입니다.
     * 키 값으로 자료를 다루는 구조입니다. 
     * 내부적으로 ArrayList3 인스턴스를 초기화합니다.
     */
    
    /**
     * 이 클래스는 배열과 연결된 목록을 사용하여 간단한 HashMap을 구현합니다.
     *
     * @since 1.0
     * @author 김영태
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