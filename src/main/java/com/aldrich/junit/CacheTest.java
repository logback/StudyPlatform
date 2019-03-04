package com.aldrich.junit;

import com.aldrich.model.Student;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author aldrich
 * @date 2018/12/28 19:39
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:ehcache.xml"})
public class CacheTest {

  @org.junit.Test
  public void test()
  {
      // 1. 创建缓存管理器
      CacheManager cacheManager = CacheManager.create("./src/main/resources/ehcache.xml");

      // 2. 获取缓存对象
      Cache cache = cacheManager.getCache("districtDataCache");

      // 3. 创建元素
      Element element = new Element("key1", "value1");

      // 4. 将元素添加到缓存
      cache.put(element);

      // 5. 获取缓存
      Element value = cache.get("key1");
      System.out.println(value);
      System.out.println(value.getObjectValue());

      // 6. 删除元素
      cache.remove("key1");

      Student student = new Student(1,"aldrich","123");
      Element element2 = new Element("taidi", student);
      cache.put(element2);
      Element value2 = cache.get("taidi");
      Student dog2 = (Student) value2.getObjectValue();
      System.out.println(dog2);

      System.out.println(cache.getSize());

      // 7. 刷新缓存
      cache.flush();

      // 8. 关闭缓存管理器
      cacheManager.shutdown();

  }

}
