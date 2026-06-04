# Wireshark

## DNS Filters

Non Successful DNS Response
(!(dns.flags.rcode==0))&&(dns.flags.response==1)

DNS Requests with missing reponses
dns && (dns.flags.response == 0) && ! dns.response_in
