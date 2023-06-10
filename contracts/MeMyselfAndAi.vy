# @version 0.3.7



####### STRUCTS ######

struct Account:
    user: address
    username: String[20]
    aid: address
    iris_id: uint256

struct IrisMmeory:
    w3MemoryName: String[70] 
    owner: address
    identifier: uint256
    signing_key_cid: String[70]

struct Medication:
    total_tabs_amount: uint256
    days: DynArray[uint256, 7]
    name: String[30]
    dosage: DynArray[uint256, 2]
    desc: String[120]

struct Daily_Routine:
    days: DynArray[uint256, 7]
    importance: uint256
    routine_description: String[200]

struct Appointment:
    days: DynArray[uint256, 7]
    importance: uint256
    location: String[100]
    appointment_desc: String[200]

struct Tag:
    name: String[120]
    summary: String[60]
    importance: uint256


deployer: public(address)

iris_identifier_count: public(uint256)


#### MAPPINGS #####

# account details 
accounts: public(HashMap[address, Account])

# has account
has_account: public(HashMap[address, bool])

# taken username
taken_username: public(HashMap[String[20], bool])

# reminder id for users
reminder_id: public(HashMap[address, uint256])

# users med reminders
users_meds: public(HashMap[address, HashMap[uint256, Medication]])

# users daily routine reminders
users_daily_routine: public(HashMap[address, HashMap[uint256, Daily_Routine]])

# users appointments
users_appointments: public(HashMap[address, HashMap[uint256, Appointment]])


# tags
tags: public(HashMap[uint256, Tag])

#tag id
tag_id: public(HashMap[address, uint256])

# iris memory
iris_id_to_memory: public(HashMap[uint256, IrisMmeory])

# all users
all_users: public(DynArray[address, 2**255])

# reminder id existence
validity: public(HashMap[address, HashMap[uint256, bool]])


#### EVENTS ####

# Create Events      

event Medication_Created:
    user: address
    med: Medication
    reminder_id: uint256

event Daily_Routine_Created:
    user: address
    daily_routine: Daily_Routine
    reminder_id: uint256

event Appointment_Created:
    user: address
    appoitment: Appointment
    reminder_id: uint256

event Tag_Created:
    user: address
    user_tag_id: uint256
    tag: Tag

#  Delete Events

event Medication_Deleted:
    user: address
    reminder_id: uint256

event Daily_Routine_Deleted:
    user: address
    reminder_id: uint256

event Appointment_Deleted:
    user: address
    reminder_id: uint256



# Daily Conditon Reminder -> triggered chainlink time based automation
event Daily_Reminder_Pushed:
    user: address
    time: uint256
    username: String[20]



@external
def __init__():
    self.deployer = msg.sender

# creating account 
@external 
def create_account(username: String[20], aid: address, w3MemoryName: String[70], signing_key_cid: String[70]):
    if self._has_account_(msg.sender) == True:
        raise "#01"

    if self.taken_username[username]:
        raise "#02"
  
    self.has_account[msg.sender] = True
    self.taken_username[username] = True

    self.accounts[msg.sender].user = msg.sender
    self.accounts[msg.sender].username = username
    self.accounts[msg.sender].aid = aid

    self.iris_identifier_count += 1
    iris_id_count: uint256 = self.iris_identifier_count

    self.accounts[msg.sender].iris_id = iris_id_count
    self.iris_id_to_memory[iris_id_count].w3MemoryName = w3MemoryName
    self.iris_id_to_memory[iris_id_count].owner = msg.sender
    self.iris_id_to_memory[iris_id_count].identifier = iris_id_count
    self.iris_id_to_memory[iris_id_count].signing_key_cid = signing_key_cid

    self.all_users.append(msg.sender)



# CREATING REMINDERS
 
@external 
def create_medication(user: address, med: Medication):   
    # pre-actions
    if self._has_account_(user) == False:
        raise "#01"
    
    if self._is_aid_or_patient_(user) == False:
        raise "#03"

    self.reminder_id[user] += 1
    med_id: uint256 = self.reminder_id[user]

    self.users_meds[user][med_id] = med
    self.validity[user][med_id] =  True
   
    log Medication_Created(msg.sender, med,  med_id)


@external
def delete_medication(user: address, reminder_id: uint256):
    # pre-actions
    if self._has_account_(user) == False:
        raise "#01"
    
    if self._is_aid_or_patient_(user) == False:
        raise "#03"

    if self.validity[user][reminder_id] == False:
        raise "04"

    log Medication_Deleted(msg.sender, reminder_id)


@external 
def create_daily_routine(user: address, daily_routine: Daily_Routine):
    # pre-actions
    if self._has_account_(user) == False:
        raise "#01"
    
    if self._is_aid_or_patient_(user) == False:
        raise "#03"
  
    self.reminder_id[user] += 1
    daily_routine_id: uint256 = self.reminder_id[user]

    self.users_daily_routine[user][daily_routine_id] = daily_routine
    self.validity[user][daily_routine_id] = True
    
    log Daily_Routine_Created(msg.sender, daily_routine,  daily_routine_id)


@external
def delete_daily_routine(user: address, reminder_id: uint256):
    # pre-actions
    if self._has_account_(user) == False:
        raise "#01"
    
    if self._is_aid_or_patient_(user) == False:
        raise "#03"

    if self.validity[user][reminder_id] == False:
        raise "04"

    
    log Daily_Routine_Deleted(msg.sender, reminder_id)


@external 
def create_appointment(user: address, appointment: Appointment):
    # pre-actions
    if self._has_account_(user) == False:
        raise "#01"
    
    if self._is_aid_or_patient_(user) == False:
        raise "#03"

    self.reminder_id[user] += 1
    appointment_id: uint256 = self.reminder_id[user]

    self.users_appointments[user][appointment_id] = appointment
    self.validity[user][appointment_id] =  True

    log Appointment_Created(msg.sender, appointment,  appointment_id)


@external
def delete_appointment(user: address, reminder_id: uint256):
    # pre-actions
    if self._has_account_(user) == False:
        raise "#01"
    
    if self._is_aid_or_patient_(user) == False:
        raise "#03"

    if self.validity[user][reminder_id] == False:
        raise "04"

    log Appointment_Deleted(msg.sender, reminder_id)



@external
def create_tag(user: address, tag: Tag):
    # pre-actions
    if self._has_account_(user) == False:
        raise "#01"
    
    if self._is_aid_or_patient_(user) == False:
        raise "#03"

    self.tag_id[user] += 1
    user_tag_id: uint256 = self.tag_id[user]

    self.tags[user_tag_id] = tag

    log Tag_Created(user, user_tag_id, tag)


# CONDITION DAILY REMINDERS
@external
def push_daily_application_reminder():
    for user in self.all_users:
        log Daily_Reminder_Pushed(user, block.timestamp, self.accounts[user].username)


### INTERNAL FUNCTIONS ###

@internal 
def _has_account_(user: address) -> bool:
    if self.has_account[user] :
        return True
    else:
        return False

@internal
def _is_aid_or_patient_(user: address) -> bool:
    if msg.sender != user:
        if msg.sender != self.accounts[user].aid:
            return False
        else:
            return True
    else:
        return True


# LIT FUNCTIONS        
@external
@view
def can_decrypt(iris_id: uint256, user: address) -> bool:
    if self.iris_id_to_memory[iris_id].owner == user :
        return True
    else:
        return False




### GETTER FUNCTIONS ###

@external
def get_account_details(user: address) -> Account :
    return self.accounts[user]

@external
def get_next_iris_id() -> uint256 :
    return self.iris_identifier_count + 1

@external
def get_user_w3memoryname_and_signing_key(user: address) -> (String[70], String[70]):
    user_iris_id: uint256 = self.accounts[user].iris_id

    user_memory_name: String[70] = self.iris_id_to_memory[user_iris_id].w3MemoryName
    user_signing_key_cid: String[70] = self.iris_id_to_memory[user_iris_id].signing_key_cid

    return (user_memory_name, user_signing_key_cid)