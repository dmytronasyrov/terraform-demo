resource "aws_route53_zone" "pharos-production" {
  name = "pharos.production"
}

resource "aws_route53_record" "server1-record" {
  zone_id = "${aws_route53_zone.pharos-production.zone_id}"
  name = "server1.pharos.production"
  type = "A"
  ttl = "300"
  records = ["8.8.8.8"]
}

resource "aws_route53_record" "www-record" {
  zone_id = "${aws_route53_zone.pharos-production.zone_id}"
  name = "www.pharos.production"
  type = "A"
  ttl = "300"
  records = ["8.8.8.8"]
}

resource "aws_route53_record" "mail1-record" {
   zone_id = "${aws_route53_zone.pharos-production.zone_id}"
   name = "pharos.production"
   type = "MX"
   ttl = "300"
   records = [
     "1 aspmx.l.google.com.",
     "5 alt1.aspmx.l.google.com.",
     "5 alt2.aspmx.l.google.com.",
     "10 aspmx2.googlemail.com.",
     "10 aspmx3.googlemail.com."
   ]
}

output "ns-servers" {
  value = "${aws_route53_zone.pharos-production.name_servers}"
}