#use strict;

my $growlnotify_location = `/usr/bin/which growlnotify`;
chomp $growlnotify_location;

sub urgent_notify_init {
    weechat::hook_signal('weechat_pv', 'notify_privmsg', '');
    weechat::hook_print('','','',1,'notify_channel','');
}

sub notify_privmsg {
    my $data = $_[2];
    my ( $nick, $message ) = split(/\t/, $data);

    send_growl($nick, $message);
}

sub notify_channel {
    my ( $data, $buffer, $date, $tag_count, $tags, $highlight, $nick, $message) = @_;

    my $channel = weechat::buffer_get_string( $buffer, 'localvar_channel') || 'UNDEF';

    if ($channel ne 'localhost' && $channel ne '&bitlbee' && $channel ne 'UNDEF') {
        send_growl($nick, $message . ' in ' . $channel);
    }

    return weechat::WEECHAT_RC_OK;
}

sub send_growl {
    my ($nick, $message) = @_;

    if ($growlnotify_location && $message =~ m/urgent/i) {
        system( $growlnotify_location, '-s', '-n', 'weechat', '-m', "$nick:$message", 'WeeChat');
    }
}

weechat::register('urgent_notify', 'nate@mediatemple.net','0.1','MIT','Growl notify, but only for urgent','','');
urgent_notify_init();

