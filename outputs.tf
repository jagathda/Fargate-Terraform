output "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  value       = aws_ecs_cluster.fargate_cluster.name
}

output "nginx_service_name" {
  description = "The name of the Nginx ECS Service"
  value       = aws_ecs_service.nginx_service.name
}
