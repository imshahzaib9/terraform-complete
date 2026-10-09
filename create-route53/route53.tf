resource "aws_route53_zone" "cieliva-zone" {
    name = "cieliva.com"
    
    tags = {
        Name = "cieliva"
    }
}

resource "aws_route53_record" "cieliva-www-record" {
    zone_id = aws_route53_zone.cieliva-zone.id
    name    = "www.cieliva.com"
    type    = "A"
    ttl     = 60
    records = ["98.86.157.118"]
}

resource "aws_route53_record" "cieliva-a-record" {
    zone_id = aws_route53_zone.cieliva-zone.id
    name    = "cieliva.com"
    type    = "A"
    ttl     = 60
    records = ["98.86.157.118"]
}

/* Now, I want to import a cravizio.com hosted zone into this terraform state. 
I will use the following command to import it:
terraform import aws_route53_zone.cravizio-zone ZONEID */

data "aws_route53_zone" "cravizio-zone" {
    name = "cravizio.com"
}

resource "aws_route53_record" "cravizio-a-record" {
    zone_id = data.aws_route53_zone.cravizio-zone.id
    name    = "www.cravizio.com"
    type    = "A"
    ttl     = 60
    records = ["98.86.157.118"]
}

