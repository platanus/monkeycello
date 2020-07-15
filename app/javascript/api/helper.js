export default function getAttributes(resourcesList) {
  return resourcesList.map((resource) => ({ id: resource.id, ...resource.attributes }));
}
