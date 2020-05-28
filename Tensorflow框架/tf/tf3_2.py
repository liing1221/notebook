# -*- coding:utf-8 -*-
# 两层简单神经网络（全连接）
import tensorflow as tf

# 定义输入数据与参数
# x = tf.constant([[0.7, 0.5]])
# x = tf.placeholder(tf.float32, shape=(1, 2))     # 输入站位表示法
x = tf.placeholder(tf.float32, shape=(None, 2))     # 多组输入占位表示法
w1 = tf.Variable(tf.random_normal([2, 3], stddev=1, seed=1))
w2 = tf.Variable(tf.random_normal([3, 1], stddev=1, seed=1))

# 定义前向传播过程
a = tf.matmul(x, w1)
y = tf.matmul(a, w2)

# 用回话计算结果
with tf.Session() as sess:
    init_op = tf.global_variables_initializer()
    sess.run(init_op)
    # print(sess.run(y))
    # print(sess.run(y, feed_dict={x:[[0.7, 0.5]]}))
    print(sess.run(y, feed_dict={x:[[0.7, 0.5], [0.2, 0.3], [0.3, 0.4], [0.4, 0.5]]}))

