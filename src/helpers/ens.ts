import fetch from 'cross-fetch';
import { namehash } from '@ethersproject/hash';
import snapshot from '@snapshot-labs/snapshot.js';
import gateways from '@snapshot-labs/snapshot.js/src/gateways.json';

const gateway = gateways[0];

export async function uriGet(
  gateway: string,
  key: string,
  protocolType = 'ipfs'
) {
  key = key.replace(
    'storage.snapshot.page',
    'storageapi.fleek.co/snapshot-team-bucket'
  );
  if (key.includes('storageapi.fleek.co')) protocolType = 'https';
  let url = `https://${gateway}/${protocolType}/${key}`;
  if (['https', 'http'].includes(protocolType))
    url = `${protocolType}://${key}`;
  return fetch(url).then(res => res.json());
}

export async function getSpaceUri(id) {
  const abi =
    'function text(bytes32 node, string calldata key) external view returns (string memory)';
  const address = '0x4976fb03C32e5B8cfe2b6cCB31c09Ba78EBaBa41';

  let uri: any = false;
  try {
    const hash = namehash(id);
    const provider = snapshot.utils.getProvider('1');
    uri = await snapshot.utils.call(
      provider,
      [abi],
      [address, 'text', [hash, 'snapshot']]
    );
  } catch (e) {
    console.log('getSpaceUriFromTextRecord failed', id, e);
  }
  return uri;
}

export async function getSpace(id) {
  let space = false;
  const uri: any = await getSpaceUri(id);
  if (uri) {
    try {
      const [protocolType, key] = uri.split('://');
      space = await uriGet(gateway, key, protocolType);
    } catch (e) {
      console.log('getSpace failed', id, e);
    }
  }
  return space;
}
