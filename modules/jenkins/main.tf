resource "helm_release" "jenkins" {
  repository = "https://aabhs5425/hello-world"
  chart      = "jenkins"
  namespace  = "jenkins"
  name       = "jenkins"

  set {
    name  = "controller.serviceType"
    value = "ClusterIP"
  }
}

output "jenkins_service_ip" {
  value = helm_release.jenkins.service_ip
}
