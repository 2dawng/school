import dns.resolver

if __name__ == '__main__':
    lookup_continue = True
    while lookup_continue:
        name = input('Enter the DNS name to resolve: ')
        record_type = input('Enter the query type [A/MX/CNAME]: ')
        answers = dns.resolver.query(name, record_type)
        if record_type == 'A':
            print('Got answer IP address: %s' %[x.to_text() for x in answers])
        elif record_type == 'CNAME':
            print('Got answer Aliases: %s' %[x.to_text() for x in answers])
        elif record_type == 'MX':
            for rdata in answers:
                print('Got answer for Mail server records: ')
                print('Mailserver:', rdata.exchange.to_text(), ' has preference', rdata.preference)
        else:
            print('Record type: %s is not implemented' %record_type)
        lookup_more = input('Do you want to lookup more records? [y/n]: ')
        if lookup_more.lower() == 'n':
            lookup_continue = False