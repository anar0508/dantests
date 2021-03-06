package org.danit.cookies;

import org.junit.Test;

import static org.junit.Assert.*;

public class EncodeDecodeTest {
    @Test
    public void main00() {
        EncodeDecode cc = new EncodeDecode();

        final String original = "!Sensitive_data#";
        //System.out.printf("Initial  :'%s'\n", s);

        String enc = cc.encrypt(original );
        //System.out.printf("Encrypted:'%s'\n", enc);
        assertEquals("ERoOyaHI5+m9Fyyqk0BLTNiafzk/rl6dQ2E5gUY5m+M=", enc);

        String dec = cc.decrypt(enc);
        //System.out.printf("Decrypted:'%s'\n", dec);
        assertEquals(original, dec);
    }
}