package com.zenika.demo;

import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;

/**
 * @author Guillaume Gerbaud
 */
@Service
public class SearchService {

    private Jedis jedis = new Jedis("redis");

    public int search(String query) {
        String res = jedis.get(query);
        int n = 1;
        if(res != null) {
            try {
                n = Integer.parseInt(res);
                n++;
            } catch (Exception ignored) {
            }
        }
        jedis.set(query, ""+n);
        return n;
    }


}
