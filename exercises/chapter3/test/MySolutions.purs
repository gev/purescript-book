module Test.MySolutions where

import Prelude
import Data.AddressBook (AddressBook, Entry, findEntry)
import Data.List (filter, head, nubByEq)
import Data.Maybe (Maybe, isJust)

-- Note to reader: Add your solutions to this file
findEntryByStreet ∷ String → AddressBook → Maybe Entry
findEntryByStreet street = head <<< filter (_.address.street >>> (==) street)

isInBook ∷ String -> String → AddressBook → Boolean
isInBook a b = isJust <<< findEntry a b

removeDuplicates ∷ AddressBook → AddressBook
removeDuplicates = nubByEq isSameEntry
  where
  isSameEntry e1 e2 = e1.firstName == e2.firstName && e1.lastName == e2.lastName
