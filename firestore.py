# -*- coding: utf-8 -*-

# Example codes from
# https://github.com/googleapis/google-cloud-python/blob/master/firestore/README.rst
from google.cloud import firestore

db = firestore.Client()
doc_ref = db.collection('users').document('alovelace')
doc_ref.set({
    'first': 'Ada',
    'last': 'Lovelace',
    'born': 1815
})

# Then query for documents
users_ref = db.collection('users')

for doc in users_ref.stream():
    print('{} => {}'.format(doc.id, doc.to_dict()))
