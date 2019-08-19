# Envoy Proxy Big Book of Examples

I had a dream! I tried to understand Kubernetes/Istio's data plane in detail...unsuccessfully. Every time I would ask a deeper question the answer would inevitably be "oh, this is done by Envoy and IPTables, but I do not know what goes under the hood". 

Therefore it became clear that understanding Envoy and the IPTables associated with each proxy scenario was key to understanding data plane and provisioning in Kubernetes. During this journey it dawned on me how amazing is Envoy Proxy.

I decide to compile each example as best as I could to help others going through the same pains since documentation is very fragmented and at times conflicting. 

Please be aware that all these examples were tested on **AWS Ubuntu 18.04**

## 1. Examples:

### 1.1 Forward Proxy

In this example of we run a (Forward Envoy Proxy)[https://www.envoyproxy.io/docs/envoy/latest/configuration/http_filters/dynamic_forward_proxy_filter] that listens on port 4999 and directs requests to their original destination. 

The practical use-case is to confine applications running on the same host as the envoy proxy by using it as a forward proxy. Applications can not communicate directly out due IPTables rules.

### 1.2 Explicit Proxy Config

This example uses the same container as the Envoy Forward Proxy example but instead of using IPTables to redirect packets, we explicitly set HTTP Proxy environment variables.

### 1.3 Original Destination

This tutorial shows how to use a [original destination cluster](https://www.envoyproxy.io/docs/envoy/latest/intro/arch_overview/upstream/service_discovery#arch-overview-service-discovery-types-original-destination) to run Envoy Proxy as a forward proxy. There is no need to explicitly configure cluster IP addresses and ports since Envoy will proxy connections to the original destination IP:port  

In this example the client making HTTP requests resides on the same host as the Envoy Proxy. A practical use of such deployment is to apply security policy to the client (or application) before proxying the connection.

### 1.4 Transparent Proxy (TPROXY)

Certainly the more tricky example. 

This tutorial shows how to use Envoy in [Transparent Proxy](https://www.envoyproxy.io/docs/envoy/latest/api-v2/api/v2/lds.proto#envoy-api-field-listener-transparent) mode. The distinguishing feature in this scenario is that there is no NAT.

Transparent Proxy or TPROXY is a Linux Kernel feature without a lot of documentation. The common referenced documentation is the [original feature write-up](https://www.kernel.org/doc/Documentation/networking/tproxy.txt)

### 1.5 Simple Front Proxy

In this example of we run a Envoy Proxy on that listens on port 4999 and directs to a server running on port 5000.
 
 The web server runs as a separate container from Envoy so any web server will do as long as it is listening on port 5000. 

### 1.6 External Authorization
 
 Still working on this one. 