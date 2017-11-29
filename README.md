# Terraform Graph Inverter

## Motivation

The default output when you run `terraform graph` did not make sense in my head. Displaying it through GraphViz was showing variables being a dependency for the resource, which was a bit strange. See the screen shot below.

![Before Image]() 

To fix this, this tool inverts the graph relationships in the outputted .dot file from `terraform graph` so the same example as above looks like this:

![After Image]() 

## Usage

```
$ tf_graph_invertor --file <file_name>.dot
Inverted File: <file_name>-inverted.dot
```

## LICENSE
MIT
