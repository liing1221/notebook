# -*- coding:utf-8 -*-

import tensorflow as tf
import numpy as np

BATCH_SIZE = 8     # 表示一次喂入神经网络的数据量(越大一次的训练效果越好，用的轮次越少，但过大也不太好（内存等原因）)
# 设置一次喂入8组数据，测试使用了4、8、16、32，了解效果
seed = 23455    # 随机种子的值

# 基于seed产生随机数
rng = np.random.RandomState(seed)
# 随机产生32行2列的矩阵，表示32组输入数据集X
X = rng.rand(32, 2)
# 从X的32行2列中取出一行，判断，若和小于1，则Y赋值为1，否则赋值为0
# Y作为输入数据集的标签（训练集的真实结果）
Y = [[int(x0 + x1 < 1)] for (x0, x1) in X]

# print('X:\n{}'.format(X))
# print('Y:\n{}'.format(Y))

# 定义神经网络的输入、参数、和输出，定义前向传播过程
x = tf.placeholder(tf.float32, shape=(None, 2))
y_ = tf.placeholder(tf.float32, shape=(None, 1))

w1 = tf.Variable(tf.random_normal([2, 3], stddev=1, seed=1))
w2 = tf.Variable(tf.random_normal([3, 1], stddev=1, seed=1))    # seed保持随机值一致

a = tf.matmul(x, w1)
y = tf.matmul(a, w2)

# 定义损失函数以及反向传播方法
loss = tf.reduce_mean(tf.square(y - y_))   # 均方误差计算损失函数
# train_step = tf.train.GradientDescentOptimizer(0.001).minimize(loss) # 梯度下降优化方法实现训练过程，学习率learning_rate设为0.001
# 17500轮后，loss达到最小
train_step = tf.train.MomentumOptimizer(0.001, 0.9).minimize(loss) # 学习率learn_fate设为0.001
# 2500轮后，loss最小
# train_step = tf.train.AdamOptimizer(0.001).minimize(loss) # 学习率learn_fate设为0.001
# 4500轮后，loss最小

# 生成回话，训练STEPS轮
with tf.Session() as sess:
    init_op = tf.global_variables_initializer()
    sess.run(init_op)
    # 输出未经训练的参数取值
    print('w1:\n{}'.format(sess.run(w1)))
    print('w2:\n{}\n'.format(sess.run(w2)))

    # 训练模型
    STEPS = 3000
    for i in range(STEPS):
        start = (i * BATCH_SIZE) % 32
        end = start + BATCH_SIZE
        sess.run(train_step, feed_dict={x:X[start:end], y_:Y[start:end]})
        if i % 500 == 0:
            total_loss = sess.run(loss, feed_dict={x:X, y_:Y})
            print('After {} training step(s), loss in all data is {}'.format(i, total_loss))

    # 输出训练后的参数值
    print('w1:\n{}'.format(sess.run(w1)))
    print('w2:\n{}'.format(sess.run(w2)))

