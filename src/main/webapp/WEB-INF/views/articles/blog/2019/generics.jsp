<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2020.7.1</div>

<h1>제네릭</h1>

<p>
제네릭은, 컴파일 타임에 좀 더 엄격한 타입 검사와 범용 알고리즘 구현을 위해 자바 5에 도입되었다.
다음 예제는 제네릭의 형태를 잘 보여준다.
Box 클래스는 기본 타입을 제외한 모든 타입 레퍼런스를 저장할 수 있는 상자를 정의한다.
</p>

<pre class="prettyprint">
package examples;

public class Box&lt;T&gt; {

  private T t;

  public void set(T t) {
    this.t = t;
  }

  public T get() {
    return t;
  }

}
</pre>

<p>
T를 타입 파라미터라 부른다.
T는 클래스 몸체 어디든지 사용될 수 있다.
Box 객체를 생성할 때 T의 타입을 지정해야 한다.
</p>

<pre class="prettyprint no-border">
Box&lt;Integer&gt; intBox = new Box&lt;Integer&gt;();
</pre>

<p>
T를 대체한 Integer를 타입 아규먼트라 부른다.
</p>

<p>
자바 7부터 도입된 타입 추론 기능으로 아래처럼 줄여 쓸 수 있다.
</p>

<pre class="prettyprint no-border">
Box&lt;Integer&gt; intBox = new Box&lt;&gt;();
</pre>

<p>
타입 파라미터는 알파벳 대문자 하나로 표기한다.
어느 문자도 상관없지만, 자바 API에서 제네릭의 타입 파라미터는 다음 관례를 지킨다.
</p>

<ul>
    <li>요소(Element)는 E</li>
    <li>키(Key)는 K</li>
    <li>숫자(Number)는 N</li>
    <li>타입(Type)은 T</li>
    <li>값(Value)은 V</li>
    <li>타입 파리미터가 하나 이상 필요할 때, 2번째 3번째 4번째 이름은 각각 S, U, V</li>
</ul>

<p>
컴파일 타임에 더 엄격한 타입 검사가 무엇인지 다음 예제로 확인하자.
</p>

<pre class="prettyprint">
package examples;

public class Test {

  public static void main(String ... args) {
    Box&lt;Integer&gt; intBox = new Box&lt;&gt;();
    intBox.set(1):
    System.out.println(intBox.get());
    intbox.set("2");
    System.out.println(intBox.get());
  }

}
</pre>

<pre class="console"><strong class="console-result">Test.java:9: error: incompatible types: String cannot be converted to Integer
    intBox.set("2");
                ^
1 error</strong></pre>

<p>
예제는 컴파일되지 않는다.
Integer 타입만 저장할 수 있는 상자에 String 타입을 넣을 수 없다는 컴파일 에러를 일으킨다. 
</p>

<h3>로(Raw) 타입</h3>

<p>
로(Raw) 타입은 타입 아규먼트가 없는 제네릭 클래스나 인터페이스를 뜻한다.
제네릭이 아닌 클래스나 인터페이스를 로 타입이라 하지 않는다.
어쩔 수 없이 사용하는 경우 외에 로 타입은 사용하지 말아야 한다.
컬렉션은 자바 5 이전에 제네릭이 아니었기에, 레거시 코드에서 로 타입으로 사용될 수 있다.
</p>

<pre class="prettyprint">
Box&lt;Integer&gt; intBox = new Box&lt;Integer&gt;();
Box rawBox = new Box();//Box는 제네릭 Box&lt;T&gt;의 로 타입
</pre>

<p>
로 타입은 약속된 동작이 있다.
위 예에서 new Box()로 생성된 Box의 메소드 파라미터와 리턴 타입은 모두 Object로 결정된다.
</p>

<p>
이전 버전과 호환을 위해,<br />
파라미터화된 타입을 로 타입에 할당할 수 있다.
</p>

<pre class="prettyprint">
Box&lt;Integer&gt; intBox = new Box&lt;Integer&gt;();
Box rawBox = intBox;
</pre>

<p>
하지만 제네릭의 엄격한 타입 검사는 더이상 기대할 수 없게 된다.
예제를 통해 확인하자.
</p>

<pre class="prettyprint">
package examples;

public class Test {

  public static void main(String ... args) {
    Box&lt;Integer&gt; intBox = new Box&lt;&gt;();
    intBox.set(1):
    System.out.println(intBox.get());
    <strong>Box rawBox = intBox;</strong>
    rawBox.set("2");
    System.out.println(rawBox.get());
  }

}
</pre>

<p>
컴파일 타임에 타입 검사를 하지 않은 예제는 컴파일되고, 실행하면 값을 출력한다.
</p>

<pre class="console"><strong class="console-result">1
2</strong></pre>

<p>
로 타입을 파라미터화된 타입에 할당할 수 있다.
</p>

<pre class="prettyprint">
Box rawBox = new Box();
Box&lt;Integer&gt; intBox = rawBox;
</pre>

<pre class="prettyprint">
package examples;

public class Test {

  public static void main(String ... args) {
    Box&lt;Integer&gt; intBox = new Box&lt;&gt;();
    intBox.set(1);
    System.out.println(intBox.get());
    Box rawBox = new Box();
    <strong>intBox = rawBox;</strong>        
    intBox.set("2");
    System.out.println(intBox.get());
  }

}
</pre>

<pre class="console"><strong class="console-result">Test.java:11: error: incompatible types: String cannot be converted to Integer
    intBox.set("2");
                ^
1 error</strong></pre>

<p>
이 경우는 컴파일 타임에 타입 검사를 한다.
</p>

<h3>제네릭 메소드</h3>

<p>
제네릭 메소드는 자신만의 타입 타라미터를 가진다.
타입 파라미터의 스코프는 그것이 선언된 메소드로 제한된다.
제네릭 메소드뿐만 아니라 일반 클래스 생성자도 자신만의 타입 파라미터를 갖도록 선언할 수 있다.
제네릭 메소드는 메소드 반환 형식 앞에 꺾쇠괄호 안의 타입 파라미터 리스트가 나타나는 모양을 갖는다.
</p>

<pre class="prettyprint">
package examples;

public interface Pair&lt;K,V&gt; {

  public K getKey();

  public V getValue();

}
</pre>

<pre class="prettyprint">
package examples;

public class IdPasswdPair&lt;K,V&gt; implements Pair&lt;K,V&gt; {

  private K key;
  private V value;

  public IdPasswdPair(K key, V value) {
    this.key = key;
    this.value = value;
  }

  @Override
  public K getKey() {
    return key;
  }

  @Override
  public V getValue() {
    return value;
  }

}
</pre>

<pre class="prettyprint">
package examples;

public class Util {

  <strong>//제네릭 메소드
  public static &lt;K,V&gt; boolean compare(Pair&lt;K,V&gt; p1, Pair&lt;K,V&gt; p2) {
    return p1.getKey().equals(p2.getKey()) &amp;&amp; p1.getValue().equals(p2.getValue());
  }</strong>

  public static void main(String[] args) {
    if (args.length == 2) {
      Pair&lt;String, String&gt; inputData = new IdPasswdPair&lt;&gt;(args[0], args[1]);
      Pair&lt;String, String&gt; storedData = new IdPasswdPair&lt;&gt;("xman31", "1987qwertY");
      <strong>boolean isSame = Util.compare(inputData, storedData);</strong>
      if (isSame) {
        System.out.println("로그인에 성공했습니다.");
      } else {
        System.out.println("로그인에 실패했습니다. 아이디와 패스워드를 확인하세요");
      }
    } else {
      System.out.println("실행 방법: java examples.Util '아이디' '패스워드'");
    }
  }

}
</pre>

<p>
compare 메소드를 호출하는 완전한 구문은 다음과 같다.
</p>

<pre class="prettyprint no-border">
boolean isSame = Util.<strong>&lt;String, String&gt;</strong>compare(inputData, storedData);
</pre>

<p>
타입 추론 기능으로 꺾쇠괄호 사이에 타입을 지정하지 않고 제네릭 메소드를 일반 메소드처럼 호출할 수 있다.
</p>

<pre class="prettyprint no-border">
boolean isSame = Util.compare(inputData, storedData);
</pre>

<h3>제약된 타입 파라미터</h3>

<p>
숫자에 대해 작동하는 메소드는 Number 또는 Number 하위 클래스의 인스턴스만 허용하려고 할 수 있다.
한계를 지정하는 타입 파라미터를 제약된 타입 파라미터라 한다.
제약된 타입 파라미터를 선언하려면 파라미터 이름과 extends 키워드, 그리고 상위 제약 타입을 나열한다.
</p>

<pre class="prettyprint">
package examples;

public class Box<strong>&lt;T extends Number&gt;</strong> {

  private T t;

  public void set(T t) {
    this.t = t;
  }

  public T get() {
    return t;
  }

}
</pre>

<p>
Box 클래스 선언에서 <strong>&lt;T extends Number&gt;</strong>를 타입 파라미터 섹션이라 한다.
&lt;T extends java.io.Serializable&gt;처럼 제약이 인터페이스일 수 있다.
제약이 인터페이스라도 extends 키워드를 사용한다.
타입 파라미터 섹션에서 제약을 하나 이상 둘 수 있다.
타입 파라미터 리스트는 하나 이상의 인터페이스, 또는 클래스 하나와 하나 이상의 인터페이스로 구성할 수 있다.
클래스 하나와 인터페이스가 섞여 있다면 타입 파라미터 리스트에서 클래스를 맨 처음 나오게 해야 한다.
</p>

<pre class="prettyprint no-border">
&lt;T extends Aclass &amp; Binterface &amp; Cinterface&gt;
</pre>

<h4>제네릭 메소드와 제약된 타입 파라미터</h4>

<pre class="prettyprint">
package examples;

public class GenericMethodsWithBoundedTypeParametersTest {

  public static &lt;T extends Number &amp; Comparable&lt;T&gt;&gt; int countGreaterThan(T[] array, T elem) {
    int count = 0;
    for (T e : array) {
      if (e.compareTo(elem) &gt; 0) {
        ++count;
      }
    }
    return count;
  }

  public static void main(String[] args) {
    Integer[] arr = {1,2,3,4,5,6,7,8,9,10};
    int count = countGreaterThan(arr,7); //7보다 큰 배열 요소 수
    System.out.println(count);
  }

}
</pre>

<pre class="console"><strong class="console-result">3</strong></pre>

<p>
Comparable&lt;T&gt; 인터페이스는 단 하나의 메소드만 정의한다.
</p>

<pre class="prettyprint">
package java.util;

public interface Comparable&lt;T&gt; {
  public int compareTo(T o);
}
</pre>

<p>
Comparable&lt;T&gt; 인터페이스의 compareTo 메소드의 구현 내용은 약속되어 있다.
a.compareTo(b)와 같이 실행된다고 가정하면, 메소드는 다음 값을 반환해야 한다.
</p>

<pre style="border: 2px dotted #999; padding: 5px;">
if a == b, 0.
if a &gt; b, 1.
if a &lt; b, -1. 
</pre>

<p>
Integer 클래스는 Number 클래스를 상속하며 Comparable&lt;Integer&gt; 인터페이스를 구현한다.
Double, Long, Float, Short, Byte도 Number 클래스를 상속하며 Comparable&lt;Integer&gt; 인터페이스를 구현한다.
</p>

<h3>제네익의 상속</h3>

<p>
다음 메소드를 가정하자:
</p>

<pre class="prettyprint no-border">
public void boxTest(Box&lt;Number&gt; n) { /* ... */ }
</pre>

<p>
이 메소드에 Box&lt;Integer&gt;나 Box&lt;Double&gt;를 전달할 수 있을까? 없다.
Box&lt;Integer&gt; and Box&lt;Double&gt;은 Box&lt;Number&gt;의 서브 타입이 아니기 때문이다. 
A와 B가 관계가 있건 없건 상관없이 MyClass&lt;A&gt;와 MyClass&lt;B&gt;는 관계가 없다.
MyClass&lt;A&gt;와 MyClass&lt;B&gt;의 부모는 Object 클래스다.
</p>

<p>
Number와 Integer는 상속 관계다.<br />
<img src="https://lh3.googleusercontent.com/u__lmjkU1jvaw0f6r55mnnIso_z-NCFNQeWxI_MkSurqypsyNr-IiMorp10Tww8JDJn7gxmKH1qyoCviYcZeJbKvytXi4Ia133FgITkW5hQtvEfUvWZxugPK0Jr3cAMZvmcsk9DaUjYFS7CYbMDoQg0NummdQSO5NA1SNwxH2QTPJzVkx6cQLgCpjlnsucjSnnmAJHsdMScCQ9eDe4vReAJiYXFCmZyD_A-SXiPqnpXracCDYMa6cy4z59fcOk-DZrtD-CDGWUwKuWvhVOrRks4FSzM57DBstecbAm0bHjnONIAElbT6qmMU9fNZs29bcOUw55stXRgA06jfOM0I0kAs4MbN60NQy-StsU7FDeQB4qoAkYxl9A_o5wfRaUK9SP85b-af5iYqtH8KknPFzq9DtTbR49tJpyXnUp1g4jpumELo0B7XqXzXOD6TXAtdOm44eXBzyiZaAHyoAgVM8Rrizh0Vzw6QFML-SEL_qS6pBsmZPqaffMfXUeYf73mCgAEYMQ6vEUlcW2cezbo-bNNIUkEUVfADRA9jMZBiWoDKYTIw9YpBjzGiSTcPxV7VxfUpyLdUC26ahR61tT8Xa8F84sUy9KNj1i2vJo_pv48ocFmwN8Ud-BBDM49LHyFmnlcZ5RH9i0ptu6scwRRpyMp-pg65fh5Cca8v5Oveo-KDUTP1f5XeuQgjhhIb=w553-h430-no?authuser=0" alt="Number Integer" />
</p>

<p>
Number와 Integer가 상속 관계라 하더라도 Box&lt;Number&gt; 와 Box&lt;Integer&gt;는 아무런 관계가 없다.<br />
<img src="https://lh3.googleusercontent.com/Wa6ncjpOJRoB1ESsXZys0ZF6tNilJ9EtMLVApiIqSJJ2Q0XOC4n5WmF3DotUYOLYKSyyp_KZJC6qkMwjGLZEqmnITFfcD9aV7iCiUAJ9nuIvImkv8fGb3aBL0rKt-EXDTr8f8tU04Vfao5Rg4tr_wgVnmkNxHfDu33nHUX6TcQSc9e3Yvwja5YDdigVmbgE-zh5QG8cgtfvd3liRo_DhDKiPK4BQj5HGFMlRWwYN6hcce-KZiLtAYd-4N_am7Ki6yjGU6K-W7zVyREczVydrsnGJwq2rocjBxxv323mB9qX9ixezPTN5kIViC21VybBv8pc79-6e2lQYayggrAJ_atGwqWE4L31VI3sxehFFqQg7_yLG4eHis-_VqXaApsPIq6U2ow1Dz1I9fAurW9sHtT2G-s_2R4w_qz-SwveTENzZLGtdY6xAOmfp_mBUmRM7ZEptOStMUOsDOeMR9PxRfPoqH0CGNETFdLK0S3cHZwCUGX6wSqvHDRRsFW2fj772JXyB-rf7Rs15MgWfny_NuZEW5Ne9fRjCjnIaA0zaLi2pFQlv3u-l4_RP9xVN4JA5aroS7YK4vxoLPh4VoXMjAlAUGwyYNe5GVc7nWbHhsAtC_1-X4bZjxDcbiImca7wON1rmlg2tBFSDIcMdd47LpoL14dN3eO0l0WKQqEFqQ1EiRJDhBXB7T3vcCd77=w544-h401-no?authuser=0" alt="Box&lt;Number&gt; Box&lt;Integer&gt;" />
</p>

<p>
Box&lt;Number&gt; 와 Box&lt;Integer&gt;는 모두 Object를 상속한다.<br />
<img src="https://lh3.googleusercontent.com/Waxnpa4pYLT12p-WwEUDjHfBwosqRUKJ4nYd2bvObMRl9RI5DVvk2Gncj0iGN7eej2w0kKUB49zMTtMt_CTWbYvuc0HE6x43IHAUXJW_5JBIIeJd1241NtFljoJ6UFJKWNmEly_N-a_-GB2RRiwu05NFhQz9DUj65_IVF5ZZ_tWqfdGDeShW5JppUk-ULejZrfSpKhH61oRcRrgA41RtyHa9e2NYthtloh0V1W_lMZ5Keb3B54Wb-M9pv79677JUgLKwAsbkuyvdv2Er3_kyM52WKFD2k1VM5jKFXiNi5Nim90laXMu0jkWjzu_VFPbgRY2N7DXFEDVAlhxVTGNRPROUCf46iowSHw5OmYyPv3XEgyFa5sWdMhykZgPOLOFnS2sNofpzthuWp7G1q3OwEeXvWY9X5bbhtA28J_A97w4TX9viTkLwg7TkjT0Gq4dtwy-irOzsTKmCvlXgKlrUqQi6BdCebflkuqocI7JAsSgugGGLxdBBE9l9Qfxcue1UrD4DQo5mqn3mDXHpkMbHfP4Kua9F9-ykBwp3sQdC1STSLO4rxfl_4dNUByOuogpQAD1Ty0TAq2xm2A1sRJYCGhaecVmvRIyGYNP1SBVrySBS6fiBFGKA0eketoSHGBzKC6X4NfxqBSHGJafJ7qdM0N8dfcK1fCbtMcPyjEdkuoF_Jd9-P5Ydallyt_tb=w588-h375-no?authuser=0" alt="Object Box&lt;Number&gt; Box&lt;Integer&gt;" />
</p>

<p>
List&lt;E&gt;는 Collection&lt;E&gt;을 상속한다.
ArrayList&lt;E&gt;는 List&lt;E&gt;를 구현한다.
따라서 List&lt;String&gt;은 Collection&lt;String&gt;의 서브 타입이고, ArrayList&lt;String&gt;는 List&lt;String&gt;의 서브 타입이다.
타입 아규먼트를 변경하지 않으면, 상속 관계는 보존된다.<br />
<img src="https://lh3.googleusercontent.com/VcqPjlaD4NxIjMuwfh6H9aNDReokvqtSwI0JMzDNS2aZfRgGGPuqWIvpw4-NkBfh8tH8dpGh_b-WcMDKJyHXaWttnlZUzDbO6Clms31w04O6TX598TeEHofr6a6mTCoGDNQms_NzTNqboR1mfzdc4aDfvkEhjfk2eoA4HC3Hcl5RPIvBfcydZhcTnugwlIlju-8RFci1GfLSq5k2YKsyLnTZxIR4qGcg7-mNFTZ0iuAzIcmNk4MTOrsXRlXwW8QOyGRsAaW-cY0guplC3IMAnM9teDlsgQf-fjMO12b20zUd0nQ15hU6PCJEgV96-vxGZWEZEaKbvZ7gD_rckecm24SxHlJ3TkXgOoeF3tm6D-ykETwpVeQ-RbS8w-BmY8rwm92r0Wyp6ua7rd4Hv6GfxtgrRaLjDayXH8JNjcLljERx_tSkmNdPc5G45M4Nv_kDRQGYWSclJWPN9LsAJk9fRGZGN0145HKLx5hMFGMjXUNEk3ZJqzg6uW7NIgDn8perJ0uB7VUgm4NgP8qIdoFDQqgnt56tcT5gHtfgMRkx_CgOXM_ZwwtTleHG0lvKRKsVgVSnOUK9gx2Q93OrcLKMfwyKQg_VMdx0Aot7ErrnFyVE0CsuOgyqw9J0PCp8OjwtC7op0qDVVY_6C1ff9NyoY5JxUEW7g7aAbJgQ-TVJebpIfVXu0mAvjmHoXCYU=w546-h420-no?authuser=0" alt="" />
</p>

<h3>타입 추론</h3>

<p>
타입 추론은 자바 컴파일러가 메소드 호출과 그에 상응하는 선언을 보고 호출에 적용되는 타입 아규먼트를 결정하는 능력이다.
</p>

<pre style="border: 2px dotted #999; padding: 5px;">
public static &lt;U&gt; void addBox(U u, List&lt;Box&lt;U&gt;&gt; boxes) {...}
</pre>

<p>
제네릭 메소드 addBox는 U라는 타입 파라미터를 정의하고 있다.
addBox라는 제네릭 메소드를 호출하려면 다음과 같이 타입 파라미터를 지정한다.
</p>

<pre class="prettyprint">
BoxDemo.<strong>&lt;Integer&gt;</strong>addBox(Integer.valueOf(10), listOfIntegerBoxes);
</pre>

<p>
일반적으로 컴파일러는 제네릭 메소드 호출의 타입 파라미터를 유추할 수 있다.
따라서 대부분의 경우 타입 파라미터를 지정할 필요 없다.
타입 추론으로 인해 제네릭 메소드를 일반 메소드처럼 호출할 수 있다.
</p>

<pre class="prettyprint">
BoxDemo.addBox(Integer.valueOf(10), listOfIntegerBoxes);
</pre>

<p>
컴파일러가 컨텍스트로부터 타입 아규먼트를 추론할 수 있는 한, 제네릭 클래스의 생성자 호출에 필요한 타입 파라미터를 다이아몬드로 바꿀 수 있다.
&lt;&gt;를 비공식적으로 다이아몬드라 한다.
예를 들어, 다음 변수 선언을 가정하자.
</p>

<pre class="prettyprint">
Map&lt;String, List&lt;String&gt;&gt; myMap = new HashMap&lt;String, List&lt;String&gt;&gt;();
</pre>

<p>
생성자의 파라미터화된 타입을 다이아몬드로 바꿀 수 있다.
</p>

<pre class="prettyprint">
Map&lt;String, List&lt;String&gt;&gt; myMap = new HashMap&lt;&gt;();
</pre>

<p>
생성자도 제네릭 메소드처럼 자신만의 타입 파라미터를 가질 수 있다.
</p>

<pre class="prettyprint">
class MyClass&lt;X&gt; {
  &lt;T&gt; MyClass(T t) {
    //...
  }
}
</pre>

<p>
다음 MyClass로부터 인스턴스를 생성하는 코드다.
</p>

<pre class="prettyprint">
MyClass&lt;Integer&gt; myObject = new MyClass&lt;&gt;("");
</pre>

<p>
컴파일러는, X를 Integer로, T를 String으로 타입을 추론한다.
자바 7 이전에는 다음과 같이 타입 아규먼트를 지정해야 했다.
</p>

<pre class="prettyprint">
MyClass&lt;Integer&gt; myObject = new MyClass<strong>&lt;Integer&gt;</strong>("");
</pre>

<p>
추론 알고리즘은 아규먼트와 대상 타입을 사용해 추론한다.
</p>

<dl class="note">
<dt>대상 타입</dt>
<dd>
<pre class="prettyprint no-border">
Integer i = Integer.parseInt("10");
</pre>
parseInt 메소드의 반환 타입은 int이지만, 이 값을 저장하는 대상인 i의 타입은 Integer이다.
즉, 대상 타입은 Integer가 된다.
</dd>
</dl>

<p>
다음은 Collections.emptyList 메소드 선언이다.
</p>

<pre style="border: 2px dotted #999; padding: 5px;">
static &lt;T&gt; List&lt;T&gt; emptyList();
</pre>

<p>
타입 추론으로 Collections.emptyList 메소드를 아래와 같이 호출할 수 있다.
</p>

<pre class="prettyprint">
List&lt;String&gt; listOne = Collections.emptyList();
</pre>

<p>
List&lt;String&gt;이 대상 타입이다.
컴파일러는, emptyList 메소드가 List&lt;T&gt; 타입을 반환하기에, T를 String이라 추론한다.
자바 7과 자바 8 모두 이렇게 추론한다.
자바 7 이전에서는 다음과 같이 T의 값을 지정해야 한다.
</p>

<pre class="prettyprint">
List&lt;String&gt; listOne = Collections.<strong>&lt;String&gt;</strong>emptyList();
</pre>

<p>
다른 상황을 보자.
</p>

<pre class="prettyprint">
void processStringList(List&lt;String&gt; stringList) {
  //process
}
</pre>

<p>
자바 7에서는 다음 문이 컴파일되지 않는다.
</p>

<pre class="prettyprint">
processStringList(Collections.emptyList());
</pre>

<p>
자바 7 컴파일러는 다음과 같은 오류 메시지를 생성한다.<br />
<strong>List&lt;Object&gt; cannot be converted to List&lt;String&gt;</strong><br />
컴파일러에는 타입 아규먼트 T의 값이 필요하므로 Object 값으로 시작한다.
따라서 Collections.emptyList를 호출하면 List&lt;Object&gt; 타입의 값이 반환되며, 이는 processStringList 메소드와 호환되지 않는다.
자바 7에서는 다음과 같이 타입 아규먼트의 값을 지정해야 한다.
</p>

<pre class="prettyprint">
processStringList(Collections.<strong>&lt;String&gt;</strong>emptyList());
</pre>

<p>
자바 8에선 대상 타입이 메소드 아규먼트를 포함하도록 확장되었다.
자바 8 컴파일러는, processStringList 메소드가 List&lt;String&gt; 타입의 아규먼트가 필요하므로, 타입 파라미터 T를 String으로 추론한다.
자바 8은 다음 코드를 컴파일한다.
</p>

<pre class="prettyprint">
processStringList(Collections.emptyList());
</pre>

<h3>와일드카드</h3>

<p>
제네릭 코드에서 물음표(?)를 와일드카드라 부른다. 
와일드카드는 알려지지 않은 타입을 표현한다.
와일드카드는 제네릭 메소드 호출이나 제네릭 클래스의 인스턴스 생성에 필요한 타입 아규먼트로 사용되지 않는다.
</p>

<h4>상한 제약 와일드카드</h4>

<p>
Number나 Number의 서브 타입(Integer, Double 및 Float)에서 작동하는 메소드를 작성하려면, 
List&lt;? extends Number&gt;로 지정한다.
List&lt;Number&gt;는 List&lt;? extends Number&gt;보다 더 제한적이다.
전자는 오로지 타입 Number 리스트와 일치하지만, 후자는 타입 Number 또는 Number 하위 클래스 목록과 일치하기 때문이다.
</p>

<pre class="prettyprint">
import java.util.Arrays;
import java.util.List;

public class WildCardTest {

  public static double sumOfList(List&lt;? extends Number&gt; list) {
    double s = 0.0;
    for (Number n : list) {
      s += n.doubleValue();
    }
    return s;
  }

  public static void main(String[] args) {
    List&lt;Integer&gt; li = Arrays.asList(1,2,3);
    System.out.println("sum = " + sumOfList(li));
  }

}
</pre>

<pre class="console"><strong class="console-result">sum = 6.0</strong></pre>

<dl class="note">
<dt>Arrays.asList</dt>
<dd>
Arrays.asList 메소드는 지정된 배열을 변환해 고정 크기 리스트를 반환한다.
고정 크기 리스트라는 데  주의해야 한다.
다음을 실행하면 런타임 에러가 발생한다.
<pre class="prettyprint no-border">
List&lt;Integer&gt; list = Arrays.asList(1,2,3);
list.add(4);//런타임 에러
</pre>
</dd>
</dl>

<h4>제약없는 와일드카드</h4>

<p>
List&lt;?&gt;처럼 쓰는 와일드카드를 제약 없는 와일드카드라 한다.
다음의 경우 제약 없는 와일드카드를 고려할 수 있다.
</p>

<ul>
  <li>Object 클래스가 제공하는 기능을 사용하는 메소드를 작성할 때.</li>
  <li>제네릭 클래스에서 타입 파라미터에 의존하지 않은 메소드를 작성할 때. 예를 들어, List.size 또는 List.clear</li>
  <li>Class&lt;?&gt;는 자주 사용되는데, Class&lt;T&gt; 클래스의 대부분 메소드가 T에 의존하지 않기 때문이다.</li>
</ul>

<p>
다음 printList 메소드를 보자.
</p>

<pre class="prettyprint">
package examples;

import java.util.Arrays;
import java.util.List;

public class PrintListTest {
  <strong>
  public static void printList(List&lt;Object&gt; list) {
    for (Object elem : list) {
      System.out.print(elem + " ");
    }
    System.out.println();
  }
  </strong>
  public static void main(String[] args) {
    List&lt;Integer&gt; li = Arrays.asList(1,2,3);
    List&lt;String&gt; ls = Arrays.asList("one","two","three");
    printList(li);//컴파일 에러
    printList(ls);//컴파일 에러
  }

}
</pre>

<p>
printList(li);와 printList(ls); 에서 컴파일 에러가 발생한다.<br />
The method printList(List&lt;Object&gt;) is not applicable for the arguments (List&lt;Integer&gt;)<br />
The method printList(List&lt;Object&gt;) is not applicable for the arguments (List&lt;String&gt;)
</p>

<p>
printList 메소드의 목적은 모든 타입의 리스트를 출력하는 것이겠지만, List&lt;Integer&gt;와 List&lt;String&gt; 타입 리스트를 출력하지 못한다.
List&lt;Integer&gt;와 List&lt;String&gt; 모두 List&lt;Object&gt;의 서브 타입이 아니기 때문이다.
파라미터 타입을 List&lt;Object&gt; 에서 List&lt;?&gt;로 수정하면, printList 메소드는 어떤 타입의 리스트도 모두 출력할 수 있다.
어떤 구체적인 타입 A에 대해, List&lt;A&gt;는 List&lt;?&gt;의 서브 타입이다.
</p>

<pre class="prettyprint">
package examples;

import java.util.Arrays;
import java.util.List;

public class PrintListTest {

  public static void printList(<strong>List&lt;?&gt;</strong> list) {
    for (Object elem : list) {
      System.out.print(elem + " ");
    }
    System.out.println();
    System.out.println("List.size() = " + list.size());
  }

  public static void main(String[] args) {
    List&lt;Integer&gt; li = Arrays.asList(1,2,3,4);
    List&lt;String&gt; ls = Arrays.asList("one","two","three");
    printList(li);
    printList(ls);
  }

}
</pre>

<pre class="console"><strong class="console-result">1 2 3 4
List.size() = 4
one two three
List.size() = 3</strong></pre>

<h4>하한 제약 와일드카드</h4>

<p>
바닥을 지정하는, 하한 제한 와일드카드는 &lt;? super A&gt; 처럼 사용한다.
</p>

<p>
Integer나 Integer의 슈퍼 타입(Number, Object)의 리스트에서 작동하는 메소드를 작성하려면,
List&lt;? super Integer&gt;를 사용한다.
</p>

<pre class="prettyprint">
public static void addNumbers(List&lt;<strong>? super Integer</strong>&gt; list) {
  for (int i = 1; i &lt;= 10;i++) {
    list.add(i);
  }
}
</pre>

<h4>와일드카드와 서브 타입</h4>

<p>
Integer가 Number의 서브 타입이라 하더라도, List&lt;Integer&gt;는 List&lt;Number&gt;의 서브 타입이 아니다.
사실상, 두 타입은 서로 관계가 없다.
List&lt;Number&gt;와 List&lt;Integer&gt;의 공통 부모는 List&lt;?&gt;이다.<br />
<img src="https://lh3.googleusercontent.com/ZsYjp1PDQQ0PByc1w7T66x98C2zrMvTqi8lW6q7-8lIOwDNU5zYRmNmHfSm_P3T6SZsJ_zZwqg1vsNznRk6PsH3jBgDJX5FV8txRsBxzJ6k3D1xADButb3TgwpqrcR3X0_VDPsYgQ6fcKDr1ulEAZ2hVvXCMvKwm2_CK3X1p9upyIuzOXBSUvGX_Y6Z0QVca2sboUSjjSNs2RllVJEwaGtrFwmnNd2PmNfottAfbdGNKKxEO-9TWgLMU4qekBcxh3IX9C30srAykqcGmkA59irL0LMBaHmbjuGwfNuVd_hJ8n89Hek3oGplXl1w9dFBKnlT8zbUZl7Lxt6e07qzUju_FglqhUTOMVb8fEs9p7WHyreab9sJ2udeuxCY_P1Swhot9Ea5PmGEF4Uk9Hx_GcQZYythjHO8bBPaErtaGrNV5q-uA0xR5aMpjkjN4KubqxT0csPRxDmBO8_xxUz2d5zG4PEOnnmNwOTRZAT8IFuSco6Y0no5aiDi-oj_BgCHGQ-t_X9Uati4-lDNm9ycKuYzft65OPFET2_Oa6830UiWwaRPJY-1uix8384wtlOlhCwjkmpynVFiBUpj2sVnouldGAEeJ-N68pZnVyfupCYtMFHlCRH1-FRfGDM-NUonSoHWVPAalJJccGb3iqZWvq9opOKuqvskQrb9G_VLzs-L8LsptXciJaXcs1HJ5=w570-h191-no?authuser=0" alt="generics-listParent" /><br />
</p>

<h3>타입 삭제</h3>

<p>
제네릭이 그대로 바이트 코드가 되지 않는다.
컴파일 과정에서 제네릭은 다음 과정을 거쳐 사라진다. 이를 타입 삭제(Type Erase)라 한다.
</p>

<ul>
    <li>제약이 있는 타입 파라미터는 제약 타입으로, 제약이 없는 타입 파라미터는 Object로 바꾼다.</li>
    <li>타입을 안전하게 보존하기 위해 필요하다면 타입 캐스트를 삽입한다.</li>
    <li>제네릭 상속에서 다형성 보존이 필요하다면 브리지 메소드를 생성한다.</li>
</ul>

<p>
다음 예는 단일 연결 리스트의 노드를 표현하는 클래스다.
</p>

<pre class="prettyprint">
public class Node&lt;T&gt; {

  private T data;
  private Node&lt;T&gt; next;

  public Node(T data, Node&lt;T&gt; next) {
    this.data = data;
    this.next = next;
  }

  public T getData() {
    return data;
  }
  
}
</pre>

<p>
제약이 없는 타입 파라미터는 Object로 변경된다.
</p>

<pre class="prettyprint">
public class Node {

  private Object data;
  private Node next;

  public Node(Object data, Node next) {
    this.data = data;
    this.next = next;
  }

  public Object getData() {
    return data;
  }
  
}
</pre>

<p>
Node 클래스를 제약 타입 파라미터를 사용하도록 변경한다.
</p>

<pre class="prettyprint">
public class Node&lt;T extends Comparable&lt;T&gt;&gt; {

  private T data;
  private Node&lt;T&gt; next;

  public Node(T data, Node&lt;T&gt; next) {
    this.data = data;
    this.next = next;
  }

  public T getData() {
    return data;
  }
  
}
</pre>

<p>
컴파일러는 제약 타입 파라미터 T를 첫 번째 제약 클래스인 Comparable로 바꾼다.
</p>

<pre class="prettyprint">
public class Node {

  private Comparable data;
  private Node next;

  public Node(Comparable data, Node next) {
    this.data = data;
    this.next = next;
  }

  public Comparable getData() {
    return data;
  }
  
}
</pre>

<p>
컴파일러는 제네릭 메소드의 파라미터에서도 타입 파라미터를 삭제한다.
</p>

<pre class="prettyprint">
public static &lt;T&gt; int count(T[] anArray, T elem) {
  int cnt = 0;
  for (T e : anArray) {
    if (e.equals(elem)) {
      ++cnt;
    }
  }
  return cnt;
}
</pre>

<p>
제약이 없는 T이기에, 컴파일러는 T를 Object로 바꾼다.
</p>

<pre class="prettyprint">
public static int count(Object[] anArray, Object elem) {
  int cnt = 0;
  for (Object e : anArray) {
    if (e.equals(elem)) {
      ++cnt;
    }
  }
  return cnt;
}
</pre>

<p>
다음과 같이 클래스가 선언되었다고 가정하자.
</p>

<pre style="border: 2px dotted #999; padding: 5px;">
class Shape
class Circle extends Shape
class Rectangle extends Shape
</pre>

<p>
모양을 그리는 제네릭 메소드를 다음과 같이 작성할 수 있다.
</p>

<pre class="prettyprint">
public static &lt;T extends Shape&gt; void draw(T shape) { /* ... */ }
</pre>

<p>
컴파일러는 T를 Shape로 대체한다.
</p>

<pre class="prettyprint">
public static void draw(Shape shape) { /* ... */ }
</pre>

<h4>타입 삭제의 효과와 브리지 메소드</h4>

<p>
때로는 타입 삭제로 인해 예상치 못한 상황이 발생한다.
다음 예는 이러한 상황이 어떻게 일어나는지 보여준다.
</p>

<pre class="prettyprint">
package examples;

public class Box&lt;T&gt; {

  private T t;

  public void set(T t) {
    this.t = t;
  }

  public T get() {
    return t;
  }
  
}
</pre>

<pre class="prettyprint">
package examples;

public class IntBox extends Box&lt;Integer&gt; {

  @Override
  public void set(Integer t) {
    super.set(t);
  }

  @Override
  public Integer get() {
    return super.get();
  }

}
</pre>

<pre class="prettyprint">
package examples;

public class BridgeTest {

  public static void main(String[] args) {
    IntBox ibox = new IntBox();
    Box box = ibox;
    box.set("Hello World!");//런타임 에러
  }
  
}
</pre>

<p>
<strong>box.set("Hello World!")</strong>에서 런타임 에러를 발생한다:
</p>

<pre class="console"><strong class="console-result">Exception in thread "main" java.lang.ClassCastException: java.lang.String cannot be cast to java.lang.Integer
  at IntBox.set(IntBox.java:1)
  at BridgeTest.main(BridgeTest.java:8)</strong></pre>

<p>
ClassCastException: java.lang.String cannot be cast to java.lang.Integer 란 메시지는 컴파일러가 만든 브리지 메소드 때문이다.
Box와 IntBox는 타입 삭제 프로세스를 거쳐 다음과 같이 변경된다.
</p>

<pre class="prettyprint">
package examples;

public class Box {

  public Object t;

  public Object set(Object t) {
    this.t = t;
  }

  public void get(Object t) {
    return t;
  }

}
</pre>

<pre class="prettyprint">
package examples;

public class IntBox extends Box {

  @Override
  public void set(Integer t) {
    super.set(t);
  }
  <strong>
  //Bridge method generated by the compiler
  public void set(Object t) {
    setData((Integer) t);
  }
  </strong>
  @Override
  public Integer get(Integer t) {
    return super.get();
  }

}
</pre>

<p>
타입 삭제 후, 메소드 시그니처가 일치하지 않는다.
Box의 메소드는 set(Object)가 되고 IntBox의 메소드는 set(Integer)이 된다.
따라서 IntBox.set(Integer)은 Box.set(Object)를 오버라이딩하지 않는다.
다형성을 유지하기 위해 자바 컴파일러는 브리지 메소드를 생성하여 서브 타입이 기대한 대로 작동하도록 한다.
이렇듯 제네릭을 상속하거나 구현하는 클래스를 컴파일할 때, 컴파일러는 타입 삭제 프로세스의 일부로서 브리지 메소드라는 복합 메소드를 생성할 수 있다.
intBox 클래스를 위해, 컴파일러는 set(Integer)를 위한 브리지 메소드를 생성한다.
브리지 메소드에 대해 걱정할 필요는 없지만 익셉션 메시지를 확인할 때 브리지 메소드의 존재를 인식하지 못하면 혼란스러울 수 있다.
</p>

<h4>구체화할 수 없는 타입</h4>

<p>
런타임에 완전히 사용 가능한 타입을 '구체화할 수 있는 타입'이라 한다.
구체화할 수 있는 타입은 기본 타입, 제네릭이 아닌 타입, 로(Raw)-타입, 제약 없는 와일드카드다.
</p>

<p>
구체화할 수 없는 타입으로는 컴파일 타임에 타입 삭제 프로세스에 의해 제거되는 정보를 가진 타입으로 제약 없는 와일드카드를 제외한 제네릭 코드가 그것이다.
예들 들어, 런타임에 JVM은 List&lt;String&gt;와 List&lt;Integer&gt;의 차이를 구별할 수 없다.
</p>

<h4>힙(Heap) 오염</h4>

<p>
힙 오염은 파라미터화된 타입의 변수가 파라미터화된 타입이 아닌 객체를 참조할 때 발생한다.
이 상황은 컴파일 시 unchecked 경고를 발생하는 코드를 수행할 때 일어난다.
unchecked 경고가 컴파일 또는 런타임에 발생하면, 파라미터화된 타입을 포함하는 동작의 올바름을 검증할 수 없다.
예를 들어 힙 오염은 로-타입과 파라미터화된 타입을 섞어 쓸 때나, unchecked 경고를 내는 타입 캐스트를 수행할 때 발생한다.
</p>

<p>
모든 코드가 동시에 컴파일되는 정상적인 상황에서 컴파일러는 잠재적인 힙 오염에 대해 unchecked 경고를 낸다.
코드를 분리하여 컴파일하게 되면 힙 오염의 잠재적 위험을 감지하는 게 힘들어진다.
코드가 경고 없이 컴파일되면 힙 오염은 일어나지 않는다.
</p>

<h4>구체화할 수 없는 타입 파라미터를 가진 가변 아규먼트 메소드의 잠재적 취약점</h4>

<p>
구체화할 수 없는 파라미터를 가진 가변 아규먼트(varargs) 메소드는 힙 오염을 발생시킬 수 있다.
</p>

<p>
자바 5에 도입된, 가변 아규먼트 메소드는 아규먼트 수를 조절하여 호출할 수 있게 해 준다.
</p>

<pre class="prettyprint">
package examples;

public class VarargsTest {

  public static void sum(<strong>int ... a</strong>) {
    int sum = 0;
    for (int i : a) {
      sum += i;
    }
    System.out.println(sum);
  }
  
  public static void main(String[] args) {
    sum();
    sum(1);
    sum(1,2,3);
    sum(1,2,3,4);
  }

}
</pre>

<pre class="console"><strong class="console-result">0
1
6
10</strong></pre>

<p>
구체화할 수 없는 타입 파라미터를 가진 가변 아규먼트 메소드를 생각해 보자.
</p>

<pre class="prettyprint">
public static void faultyMethod(<strong>List&lt;String&gt; ... l</strong>) {
  //..
}
</pre>

<p>
이 메소드를 컴파일할 때, 다음 경고가 faultyMethod 메소드의 선언에서 발생한다.<br />
<strong>warning: [varargs] Possible heap pollution from parameterized vararg type l</strong><br />
왜 그럴까?
</p>

<p>
타입 삭제 프로세스 과정에서 컴파일러는 가변 아규먼트를 배열로 바꾼다.
그러나, 컴파일러는 파라미터화된 타입 배열 생성을 허락하지 않는다.
결국, 메소드 파라미터 l의 타입이 List[]가 된다.
이로 인해 힙 오염이 발생할 수 있다. 
</p>

<h3>제네릭의 제한</h3>

<p>
제네릭은 다음과 같은 제한이 있다.
</p>

<ol>
    <li>기본 타입으로 제네릭 타입의 인스턴스를 만들 수 없다.</li>
    <li>타입 파라미터의 인스턴스를 생성할 수 없다.</li>
    <li>정적 필드 타입으로 타입 파라미터를 선언할 수 없다.</li>
    <li>instanceof 연산자에 타입 파라미터를 사용할 수 없다.</li>
    <li>파라미터화된 타입으로 배열을 만들 수 없다.</li>
    <li>제네릭 클래스는 직간접적으로 Throwable 클래스를 상속할 수 없다.</li>
    <li>메소드는 타입 파라미터의 인스턴스를 catch 할 수 없다.</li>
    <li>타입 삭제 후 같은 시그니처를 가지게 되는 메소드를 오버로드할 수 없다.</li>
</ol>

<h4>1. 기본 타입으로 제네릭 타입을 인스턴스로 만들 수 없다.</h4>

<pre class="prettyprint">
class Password&lt;T&gt; {
  private T t;

  public Password(T t) {
    this.t = t;
  }
}
</pre>

<p>
Password 객체를 생성할 때, 타입 파라미터 T에 기본 타입을 대체할 수 없다.
</p>

<pre class="prettyprint">
Password&lt;int&gt; pw = new Password&lt;&gt;(19019);//컴파일 에러
</pre>

<h4>2. 타입 파라미터의 인스턴스를 생성할 수 없다.</h4>

<pre class="prettyprint">
public static <strong>&lt;E&gt;</strong> append(List&lt;E&gt; list) {
  <strong>E elem = new E();</strong>//컴파일 에러
  list.add(elem);
}
</pre>

<h4>3. 정적 필드 타입으로 타입 파라미터를 선언할 수 없다.</h4>

<pre class="prettyprint">
public class BasketballPlayer&lt;T&gt; {
  private static T teamFouls; //가능하다고 가정하자
}
</pre>

<p>
BasketballPlayer 인스턴스를 생성한다.
</p>

<pre class="prettyprint">
BasketballPlayer&lt;Byte&gt; jodan = new BasketballPlayer&lt;&gt;();
BasketballPlayer&lt;Short&gt; pippen = new BasketballPlayer&lt;&gt;();
BasketballPlayer&lt;Integer&gt; rodman = new BasketballPlayer&lt;&gt;();
</pre>

<p>
세 BasketballPlayer 인스턴스가 공유하는 teamFouls 필드의 타입이 Byte이면서 Short이면서 Integer일 수 없다.
</p>

<h4>4. instanceof 연산자에 타입 파라미터를 사용할 수 없다.</h4>

<p>
자바 컴파일러가 제네릭 코드에서 모든 타입 파라미터를 제거하기 때문에, 런타임은 제네릭의 타입 파라미터가 사용되는지 알 수 없다.
</p>

<pre class="prettyprint">
public static &lt;E&gt; void rtti(List&lt;E&gt; list) {
  if (list instanceof ArrayList&lt;Integer&gt;) { //컴파일 에러
    //..
  }
}
</pre>

<p>
런타임은 코드에서 사용된 ArrayList&lt;Integer&gt;와 ArrayList&lt;String&gt;의 차이를 구별하지 못한다.
제약 없는 와일드카드를 사용하면 목록이 ArrayList인지는 확인할 수 있다.
</p>

<pre class="prettyprint">
public static void rtti(List&lt;?&gt; list) {
  if (list instanceof ArrayList&lt;?&gt;) { //ok
    //..
  }
}
</pre>

<h4>5. 파라미터화된 타입으로 배열을 만들 수 없다.</h4>

<pre class="prettyprint no-border">
List&lt;Integer&gt;[] arrayOfLists = new ArrayList&lt;Integer&gt;[2];//컴파일 에러
</pre>

<p>
먼저 ArrayStoreException이 발생하는 경우를 보자.
</p>

<pre class="prettyprint">
Object[] strings = new String[2];
strings[0] = "Hello";
strings[1] = 2019;//런타임에 ArrayStoreException 발생
</pre>

<p>
제네릭 리스트에서 똑같이 시도한다면, 문제가 될 수 있다.
</p>

<pre class="prettyprint">
Object[] stringLists = new List&lt;String&gt;[];//컴파일 에러가 발생하지만 가능하다고 가정하자.
stringLists[0] = new ArrayList&lt;String&gt;();//OK
stringLists[1] = new ArrayList&lt;Integer&gt;();//ArrayStoreException 익셉션이 발생해야 하지만 런타임은 이를 감지할 수 없다.
</pre>

<p>
런타임은 List&lt;String&gt;과 List&lt;Integer&gt;를 구별할 수 없기에, 
파라미터화된 리스트가 허용된다면, 
ArrayStoreException 예외를 던져야 할 상황이 오더라도 던지지 못할 것이다.
</p>

<h4>6. 제네릭 클래스는 직간접적으로 Throwable 클래스를 상속할 수 없다.</h4>

<p>
다음 클래스는 컴파일되지 않는다.
</p>

<pre class="prettyprint">
// Throwable를 상속하는 Exception을 상속
class MathException&lt;T&gt; extends Exception { .. } //컴파일 에러
</pre>

<pre class="prettyprint">
// Throwable을 직접 상속
class QueneFullException&lt;T&gt; extends Throwable { .. } //컴파일 에러
</pre>

<h4>7. 메소드는 타입 파라미터의 인스턴스를 catch 할 수 없다.</h4>

<pre class="prettyprint">
public static &lt;T extends Exception&gt; void execute(List&lt;T&gt; jobs) {
  try {
    for (T job : jobs) {
      //..
    }
  } catch (T e) {//컴파일 에러: catch 블록에서 타입 파라미터를 사용할 수 없다.
    //..
  }
}
</pre>

<p>
반면, throws 절에는 타입 파라미터를 사용할 수 있다.
</p>

<pre class="prettyprint">
class Parser&lt;T extends Exception&gt; {
  public void parse(File file) throws T { //ok
    //..
  }
}
</pre>

<h4>8. 타입 삭제 후 같은 시그니처를 가지게 되는 메소드를 오버로드할 수 없다.</h4>

<pre class="prettyprint">
public class Example {
  public void print(Set&lt;String&gt; strSet) { .. }
  public void print(Set&lt;Integer&gt; intSet) { .. }
}
</pre>

<p>
타입 삭제 후 print 메소드는 같은 시그니처를 갖게 되므로 컴파일 에러가 발생한다.
</p>

<span id="refer">참고</span>
<ul id="references">
  <li><a href="https://docs.oracle.com/javase/tutorial/java/generics/types.html">https://docs.oracle.com/javase/tutorial/java/generics/types.html</a></li>
</ul>

</article>
