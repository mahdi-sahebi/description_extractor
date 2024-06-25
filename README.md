# Description Extractor

This is a project which has been written by bash script in linux.

### Problem
There is a directory which consists of several sub-directory and 
some source code files in each one.

Each module(pair of .cc and .h) has a description in doxygen format.
It is required to extract and gather all of these descriptions from
source codes and make a text report.

The description is located between '/**' and '*/', and also the '@' should be removed from every line of description.

### Example
Imagine structure below:

```
my_project
--network
----tcp.h
----tcp.cc
----udp.h
----udp.cc
--filesystem
----fat.h
----fat.cc
--image
----png.h
----png.cc
```

The source codes don't matter because the descriptions have been placed in
the source **.h** files.

#### Contents

**tcp.h**

```
...
/**@ This is the tcp socket.
 * @ version 1.1.0
 * @
 */
...
```

**udp.h**

```
...
/**@ This is the udp socket.
 * @ version 1.0.1
 * @
 */
...
```

**fat.h**

```
...
/**@ This is the fat file stsytem wrapper.
 * @ version 2.0.0
 * @
 */
...
```

**png.h**

```
...
/**@ This is the png image reader.
 * @ version 1.4.4
 * @
 */
...
```



**Expected Report**
Now if we execute the bash script for path mentioned, we need to achieve output below:

```
[my_project]

1. tcp:
 This is the tcp socket.
 version 1.1.0

2. udp:
 This is the udp socket.
 version 1.0.1

3. fat:
 This is the fat file stsytem wrapper.
 version 2.0.0

4. png:
 This is the png image reader.
 version 1.4.4

```
