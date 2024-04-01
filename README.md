## Sonarqube

![squareops_avatar]

[squareops_avatar]: https://squareops.com/wp-content/uploads/2022/12/squareops-logo.png

### [SquareOps Technologies](https://squareops.com/) Your DevOps Partner for Accelerating cloud journey.
<br>
The module deploys a Sonarqube instance on a Kubernetes cluster. Sonarqube is an open-source tool that provides continuous code quality management to perform automatic reviews with static analysis of code to detect bugs, code smells, and security vulnerabilities. This module uses Kubernetes manifests to deploy Sonarqube along with a PostgreSQL database. It allows for easy configuration of the Sonarqube instance through the use of Terraform variables.

## Supported Versions:

|  Sonarqube Helm Chart Version           |     K8s supported version (EKS, AKS & GKE)  |  
| :-----:                       |         :---         |
| **1.0.30**          |    **1.23,1.24,1.25,1.26,1.27**      |


## Usage Example

```hcl
module "sonarqube" {
  source = "https://github.com/sq-ia/terraform-kubernetes-sonarqube.git"
  sonarqube_config = {
    hostname                       = "sonarqube.squareops.in"
    values_yaml                    = file("./helm/values.yaml")
    storage_class_name             = "gp2"
    sonarqube_volume_size          = "5Gi"
    grafana_monitoring_enabled     = true
    postgresql_volume_size         = "20Gi"
    postgresql_password_external   = ""
    postgresql_external_server_url = ""
  }
}

```
- Refer [AWS examples](https://github.com/sq-ia/terraform-kubernetes-sonarqube/tree/main/examples/complete/aws) for more details.
- Refer [Azure examples](https://github.com/sq-ia/terraform-kubernetes-sonarqube/tree/main/examples/complete/azure) for more details.
- Refer [GCP examples](https://github.com/sq-ia/terraform-kubernetes-sonarqube/tree/main/examples/complete/gcp) for more details.

## IAM Permissions
The required IAM permissions to create resources from this module can be found [here](https://github.com/sq-ia/terraform-kubernetes-sonarqube/blob/main/IAM.md)

## Important Notes
  1. In order to enable the exporter, it is required to deploy Prometheus/Grafana first.
  2. The exporter is a tool that extracts metrics data from an application or system and makes it available to be scraped by Prometheus.
  3. Prometheus is a monitoring system that collects metrics data from various sources, including exporters, and stores it in a time-series database.
  4. Grafana is a data visualization and dashboard tool that works with Prometheus and other data sources to display the collected metrics in a user-friendly way.
  5. To deploy Prometheus/Grafana, please follow the installation instructions for each tool in their respective documentation.
  6. Once Prometheus and Grafana are deployed, the exporter can be configured to scrape metrics data from your application or system and send it to Prometheus.
  7. Finally, you can use Grafana to create custom dashboards and visualize the metrics data collected by Prometheus.
  8. This module is compatible with EKS, AKS & GKE which is great news for users deploying the module on an AWS, Azure & GCP cloud. Review the module's documentation, meet specific configuration requirements, and test thoroughly after deployment to ensure everything works as expected.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.sonarqube](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.sonarqube](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [random_password.postgresql_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_password.sonarqube_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_helm_chart_version"></a> [helm\_chart\_version](#input\_helm\_chart\_version) | Version of the Sonarqube chart that will be used to deploy Sonarqube application. | `string` | `"10.4.1"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Name of the Kubernetes namespace where Sonarqube will be deployed. | `string` | `"sonarqube"` | no |
| <a name="input_postgresql_passwd_length"></a> [postgresql\_passwd\_length](#input\_postgresql\_passwd\_length) | Length of the password for postgresql | `number` | `20` | no |
| <a name="input_sonarqube_config"></a> [sonarqube\_config](#input\_sonarqube\_config) | Specify the configuration settings for Sonarqube, including the hostname, storage options, and custom YAML values. | `any` | <pre>{<br>  "grafana_monitoring_enabled": false,<br>  "hostname": "",<br>  "postgresql_external_server_url": "",<br>  "postgresql_password_external": "",<br>  "postgresql_volume_size": "",<br>  "sonarqube_volume_size": "",<br>  "storage_class_name": "",<br>  "values_yaml": ""<br>}</pre> | no |
| <a name="input_sonarqube_passwd_length"></a> [sonarqube\_passwd\_length](#input\_sonarqube\_passwd\_length) | Length of the password for sonarqube | `number` | `20` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sonarqube"></a> [sonarqube](#output\_sonarqube) | Information about the SonarQube instance, including the username, password, and URL. |
| <a name="output_sonarqube_postgresql_password"></a> [sonarqube\_postgresql\_password](#output\_sonarqube\_postgresql\_password) | Password for the PostgreSQL database deployed with SonarQube. |
| <a name="output_sonarqube_postgresql_username"></a> [sonarqube\_postgresql\_username](#output\_sonarqube\_postgresql\_username) | Username for the PostgreSQL database deployed with SonarQube. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contribution & Issue Reporting

To report an issue with a project:

  1. Check the repository's [issue tracker](https://github.com/sq-ia/terraform-kubernetes-sonarqube/issues) on GitHub
  2. Search to see if the issue has already been reported
  3. If you can't find an answer to your question in the documentation or issue tracker, you can ask a question by creating a new issue. Be sure to provide enough context and details so others can understand your problem.

## License

Apache License, Version 2.0, January 2004 (http://www.apache.org/licenses/).

## Support Us

To support a GitHub project by liking it, you can follow these steps:

  1. Visit the repository: Navigate to the [GitHub repository](https://github.com/sq-ia/terraform-kubernetes-sonarqube).

  2. Click the "Star" button: On the repository page, you'll see a "Star" button in the upper right corner. Clicking on it will star the repository, indicating your support for the project.

  3. Optionally, you can also leave a comment on the repository or open an issue to give feedback or suggest changes.

Starring a repository on GitHub is a simple way to show your support and appreciation for the project. It also helps to increase the visibility of the project and make it more discoverable to others.

## Who we are

We believe that the key to success in the digital age is the ability to deliver value quickly and reliably. That’s why we offer a comprehensive range of DevOps & Cloud services designed to help your organization optimize its systems & Processes for speed and agility.

  1. We are an AWS Advanced consulting partner which reflects our deep expertise in AWS Cloud and helping 100+ clients over the last 5 years.
  2. Expertise in Kubernetes and overall container solution helps companies expedite their journey by 10X.
  3. Infrastructure Automation is a key component to the success of our Clients and our Expertise helps deliver the same in the shortest time.
  4. DevSecOps as a service to implement security within the overall DevOps process and helping companies deploy securely and at speed.
  5. Platform engineering which supports scalable,Cost efficient infrastructure that supports rapid development, testing, and deployment.
  6. 24*7 SRE service to help you Monitor the state of your infrastructure and eradicate any issue within the SLA.

We provide [support](https://squareops.com/contact-us/) on all of our projects, no matter how small or large they may be.

To find more information about our company, visit [squareops.com](https://squareops.com/), follow us on [Linkedin](https://www.linkedin.com/company/squareops-technologies-pvt-ltd/), or fill out a [job application](https://squareops.com/careers/). If you have any questions or would like assistance with your cloud strategy and implementation, please don't hesitate to [contact us](https://squareops.com/contact-us/).
