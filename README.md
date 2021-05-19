Reference: _
https://helm.sh/docs/topics/library_charts/
https://git.app.uib.no/caleno/helm-charts/-/tree/601c467676073b2e5e5d1c9e9a9a61ec10b4bd7d/incubator/common

Commands used:

* create library chart
helm create libchart
rm -rf libchart/templates/*
rm -f libchart/values.yaml 
* create  _*.yaml & _*.tpl template in template folder.
* In Chart edit the type: library
* Create application chart - helm create appchart
* add below lines in appchart -> charts
dependencies:
- name: libchart
  version: 0.1.0
  repository: file://../libchart
* create templates and values

* helm dependency update appchart/
* helm install mydemo appchart/ --debug --dry-run



Library chart helps you define similar definitions that could be shared among your Helm charts. this can be Helper, Logic, Templates depends on your need.

This is exactly what I am looking for, so let’s see how it works.
https://miro.medium.com/max/1050/1*SyVOW5L65Q9POyspaDSm-w.png

create a chart, just like any chart

You start off my creating chart as usual.

change type of Chart.yaml to library
https://miro.medium.com/max/1050/1*UsSU6rhdqLMWvBTTxoqvMg.png

type: library

now, it’s time for our protagonist, named template.

Typically, Helm will not make an object out in Kubernetes cluster for files that start with _ (_xxx.tpl, _xxxx.yaml) just as your default _helpers.tpl

so, complying with this rule I can now conveniently create my objects like this under my library chart’s templates folder
https://miro.medium.com/max/762/1*ty3CgvKcolqpOTIqB61GOA.png

all files start with _

the last thing we need to do is to wrap our object’s definition in this named template
https://miro.medium.com/max/1050/1*Rg5QBOwwaI7DedKwduXBSA.png

define a name for our lib chart

we are now all set to use this library chart in our services

to use this library we need to go to our services’ helm chart and add this little thing called dependencies
https://miro.medium.com/max/1050/1*zG9iw4Pdw1sPVuuhZcG2mA.png

add this dependencies in our services’ chart

in my case, it’s a mono-repo. so, I can reference to the shared-lib chart from file

then we can now run this command

    helm dependency update ./helm
https://miro.medium.com/max/1050/1*SRDXAtSaMbnHRTnvfhK2pg.png


you will see a file created under charts directory
https://miro.medium.com/max/975/1*HByRTHFSKQ0onMur6Nbegg.png

the usage is utterly simple. in your service’s templates directory you will need just only one file app.yaml (you name it)
https://miro.medium.com/max/1050/1*Peeld9kmOTxSTPFrSlGi1w.png

within this file, you can use include to use lib-chart object definition you defined earlier

that’s it, try dry-run install your chart and you can see the objects will be created as expected
https://miro.medium.com/max/1050/1*RJufQfSmHy3GKFbu3jMcog.png

that’s it, hope you guys find this useful and can apply this in your work.

find the code example in this repo: https://github.com/InsomniaCoder/helm-library
