# AWK text processing - cutting stripes of input stream

Text processing is one of the AWK strong points. [text-fsm.awk](text-fsm.awk) shows how to implement simple text stream FSM machine in order to get just heading piece of kubernetes node description.


```
$ kubectl-tt-k8s2-ko describe node | awk -f text-fsm.awk
Name:               tt-k8s2-************.cz
Roles:              <none>
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    kubernetes.io/hostname=tt-k8s2-************.cz
                    scif.cz/realm=edge
                    szn/realm=edge
                    szn/tor=tor-j-***********.cz
Annotations:        node.alpha.kubernetes.io/ttl=0
                    volumes.kubernetes.io/controller-managed-attach-detach=true
Name:               tt-k8s2-************.cz
Roles:              <none>
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    kubernetes.io/hostname=tt-k8s2-************.cz
                    scif.cz/realm=edge
                    szn/realm=edge
                    szn/tor=tor-j-***********.cz
Annotations:        node.alpha.kubernetes.io/ttl=0
                    volumes.kubernetes.io/controller-managed-attach-detach=true
...
                    ```

## Notes
 * to not reveal internal information terminal output was filled with star characters
