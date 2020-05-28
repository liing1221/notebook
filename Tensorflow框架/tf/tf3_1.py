# -*- coding=utf-8 -*-
import tensorflow as tf

a = tf.constant([1.0, 2.0])
b = tf.constant([3.0, 4.0])

result = a + b
print(result)

x = tf.constant([[1.0, 2.0]])
w = tf.constant([[3.0], [4.0]])
y = tf.matmul(x, w)
print(y)

with tf.Session() as sess:
    print(sess.run(y))
    print(sess.run(result))


