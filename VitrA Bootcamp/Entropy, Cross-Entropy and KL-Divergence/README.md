# Entropy, Cross-Entropy and KL-Divergence

>### *Software is like entropy. It is difficult to grasp, weighs nothing, and obeys the second law of thermodynamics; i.e. it always increases.*
>#### *- Norman Ralph Augustine*

---
### Information Theory

[Information theory](https://en.wikipedia.org/wiki/Information_theory) was introduced by [Claude Shannon](https://en.wikipedia.org/wiki/Claude_Shannon) in his 1948 paper A Mathematical Theory of Communication. Information theory is about the efficient transmission of a message. According to the theory, the uncertainty should be reduced by 2 times for the transmission of information. Uncertainty reduction, on the other hand, can be defined as the inverse of the probability of an event to occur.


![](https://pbs.twimg.com/media/Dd9t3sBVAAISChi.jpg)

---

### Entropy

Let's give a simple example. Suppose we have a rigged dice. The probability of getting a 6 on a fair die is approximately 16.7%, while on this die let it be 20%.

* In this case, the information to be transferred will be; 
>$$ \log_2(1/0.20)=2.32 $$ 

* Considering the information transferred on a fair dice as;
>$$ \log_2(6)=2.58 $$ 

It can be said that our uncertainty has not changed much.

In order to calculate the information to be received for a total roll of the dice, the probability of the event occurring for each value is multiplied by the information contained in the event, and all values are added. This total transferred information is called ***entropy***.

>Considering the example we gave, entropy is calculated with the formula;
$$ H(p) = \sum_ip_i.log_2(1/p_i) = -\sum_ip_i.log_2(p_i) $$

Entropy refers to the average amount of information in a sample taken from a given probability distribution. It explains the ***irregularity*** of the aforementioned probability distribution.

![](https://miro.medium.com/max/2358/1*i7cfMirN2WpaJhYZa1a1Mg.png)

---
### Cross - Entropy

***Cross-entropy*** is built on the idea of entropy. It arises when each state is expressed in bits.  In other words, it calculates the number of bits needed to represent or transmit an average event.


In our previous example, we used 1 bit for each state, ie 6 bits in total. Messages of different lengths can be used to convey information to each situation. This ***average message length*** gives the ***cross-entropy***.

> Cross-entropy is calculated similarly to entropy with the formula;
$$ H(p, q) = -\sum_ip_i.log_2(q_i) $$

#### Cross - Entropy Loss in Machine Learning

Cross-entropy is often preferred as cost func in classifier training in machine learning.

> To calculate the cross entropy loss, the following formula, which is quite similar to the cross entropy formula, is considered;
> $$ H(p, q) = -\sum_ip_i.log(q_i) $$

---

### KL - Divergence

Cross-entropy may cause more information to be sent during the transfer of information. For example, in an example where we express each state with a bit, our entropy of 2.86 means that our useful information is *2.86* bits. However, if we express our situations with messages of various lengths and therefore our cross entropy is *5.1*, it means that we are sending more information to the receiver than it needs. This ***difference between cross-entropy and entropy*** is called ***KL-Divergence***.

> KL-Divergence is calculated with the formula;
$$D_{KL}(p||q) = H(p, q) - H(p)  $$

---
### Let's make an example with all that we've learned!
At this point, we will calculate the cross entropy loss of a simple classification example with the help of the ***tensorflow*** library.

Suppose we train a model that classifies an image as cat, dog, or bird. The probabilities obtained as a result of the classification of a dog photo given to the model by the model are as follows:
|                |Predicted class |Actual class |
|----------------|----------------|-------------|
|Cat      		 |`0.7`           |`0`          |
|Dog             |`0.85`          |`1`          |
|Bird            |`0.22`          |`0`          |

In this case, we can calculate the cross-entropy loss that occurs as follows:
```python
# importing the cross entropy library
from tensorflow.keras.losses import CategoricalCrossentropy
```
```python
# creating vectors for predicted and actual classes
actual_values = [0, 1, 0]
predicted_values = [0.7, 0.85, 0.22]
```
```python
# creating CategoricalCrossentropy loss object
ce_loss = CategoricalCrossentropy()
```
```python
# calculating and printing the loss
print(ce_loss(actual_values, predicted_values).numpy)
```
> 0.73349845

---

### References:

* [A Short Introduction to Entropy, Cross-Entropy and KL-Divergence](https://www.youtube.com/watch?v=ErfnhcEV1O8)
* [A Gentle Introduction to Cross-Entropy for Machine Learning](https://machinelearningmastery.com/cross-entropy-for-machine-learning/)
* [Cross-Entropy Loss and Its Applications in Deep Learning](https://neptune.ai/blog/cross-entropy-loss-and-its-applications-in-deep-learning)