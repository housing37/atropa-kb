__fname = 'track_irc'
__filename = __fname + '.py'
cStrDivider = '#================================================================#'
print('', cStrDivider, f'START _ {__filename}', cStrDivider, sep='\n')
print(f'GO {__filename} -> starting IMPORTs and globals decleration')

#------------------------------------------------------------#
#   IMPORTS                                                  #
#------------------------------------------------------------#
import sys, os, time
from datetime import datetime
import requests, json
import socket, threading
#from web3 import Web3
#import inspect # this_funcname = inspect.stack()[0].function
#parent_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
#sys.path.append(parent_dir) # import from parent dir of this file

#------------------------------------------------------------#
#   GLOBALS
#------------------------------------------------------------#

#------------------------------------------------------------#
#   FUNCTION SUPPORT                                         #
#------------------------------------------------------------#
# Function to send PING commands every 400 seconds
#def send_ping_commands():
#    while True:
#        ping = '... keep-alive PING'
#        print('['+get_time_now()+'] '+ping)
#        irc.send(bytes("PING :keep-alive\r\n", "UTF-8"))
#        #time.sleep(400)
#        wait_sleep(1, b_print=True) # sleep 'wait_sec'

# Function to listen for incoming messages
#def listen_for_messages():
def track_msgs(server, port, nick='guest50040', channel='#test', pw=''):
    # Create a socket connection to the IRC server
    irc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    irc.connect((server, port))

    # Send the IRC handshake and join the channel
    irc.send(bytes(f"USER {nick} 0 * :{nick}\r\n", "UTF-8"))
    irc.send(bytes(f"NICK {nick}\r\n", "UTF-8"))
    irc.send(bytes(f"JOIN {channel} {pw}\r\n", "UTF-8"))

    while True:
        # data = ":r_!~r@ec2-18-188-176-66.us-east-2.compute.amazonaws.com PRIVMSG #test :te"
        data = irc.recv(2048).decode("UTF-8")
        str_print = str_time = usr = msg = 'nil_str'
        if not data:
            break

        # check for ping
        if data.split()[0] == "PING":
            str_print = '['+get_time_now()+'] '+data.rstrip()+' ... PONG'
            print(str_print)
            irc.send(bytes(f"PONG {data.split()[1]}\r\n", "UTF-8"))
        else:
            # Print formatted msg to the console
            str_print, str_time, usr, msg = parse_msg_string(data, channel)
            print(str_print)
        
        if 'mariarahel' in usr:
            pass # TODO: notify admin
            
        # TODO: ... design / integrate DB
        #send_to_db(data, str_print, str_time, usr, msg, server, port, nick, channel)
        
    # Close the IRC connection when done
    irc.close()

def parse_msg_string(data, channel):
    # format user msg
    #str_msg_start = '!-'+nick+'@'
    str_result = str_time = usr = msg = 'nil_parse'
    
    # check for users joing / leaving channel
    if 'join' in data.lower() or 'part' in data.lower():
        str_result = '['+get_time_now()+'] '+data
    
    # check for msg format
    #elif (data[0] == ':' and data.find(str_msg_start) > -1):
    #    usr = data[1:data.index(str_msg_start):1]
    elif 'privmsg' in data.lower() or (data[0] == ':' and data.find('@') > -1):
        # ex: data = ":r_!~r@ec2-18-188-176-66.us-east-2.compute.amazonaws.com PRIVMSG #test :t_msg"
        usr = data[1:data.index('@'):1]
        msg = data[data.rfind(':')+1:-1:1]
        str_print = channel+'  <'+usr+'>    '+msg
        str_time = get_time_now()
        str_result = '['+str_time+'] '+str_print
        # ex: str_result = "[10/09/23 23:07:35.42] #test  <r_!~r>    test"
        
    # handle default
    else:
        str_result = '['+get_time_now()+'] '+data

    return str_result, str_time, usr, msg
    
#------------------------------------------------------------#
#   DEFAULT SUPPORT                                          #
#------------------------------------------------------------#
READ_ME = f'''
    *DESCRIPTION*
        track IRC with domain, port, channel
        formats and prints user messges
        
    *EXAMPLE EXECUTION*
        $ python3 {__filename} -<nil> <nil>
        $ python3 {__filename}
        
    *NOTE* INPUT PARAMS...
        nil
'''
def wait_sleep(wait_sec : int, b_print=True): # sleep 'wait_sec'
    print(f'waiting... {wait_sec} sec')
    for s in range(wait_sec, 0, -1):
        if b_print: print('wait ', s, sep='', end='\n')
        time.sleep(1)
    print(f'waited... {wait_sec} sec')
        
def get_time_now(dt=True):
    if dt: return datetime.now().strftime("%D %H:%M:%S.%f")[0:-4]
    return datetime.now().strftime("%H:%M:%S.%f")[0:-4]
    
def read_cli_args():
    print(f'\nread_cli_args...\n # of args: {len(sys.argv)}\n argv lst: {str(sys.argv)}')
    for idx, val in enumerate(sys.argv): print(f' argv[{idx}]: {val}')
    print('read_cli_args _ DONE\n')
    return sys.argv, len(sys.argv)

def go_main():
    try:
        # run tracker
        ch_lst = ["#test", "#pulsechain", "#atropa"]
        track_msgs("irc.debian.org", 6667, 'hlog', ch_lst[0]) # IRC server, port, nick, channel & channel pw (if required)
    
        # Create and start two threads
        #ping_thread = threading.Thread(target=send_ping_commands)
        #message_thread = threading.Thread(target=listen_for_messages)
        #ping_thread.start()
        #message_thread.start()
    except Exception as e:
        print(f'Error: {e}')
        
if __name__ == "__main__":
    ## start ##
    run_time_start = get_time_now()
    print(f'\n\nRUN_TIME_START: {run_time_start}\n'+READ_ME)
    lst_argv_OG, argv_cnt = read_cli_args()
    
    ## exe ##
    go_main()
    
    ## end ##
    print(f'\n\nRUN_TIME_START: {run_time_start}\nRUN_TIME_END:   {get_time_now()}\n')

print('', cStrDivider, f'# END _ {__filename}', cStrDivider, sep='\n')
