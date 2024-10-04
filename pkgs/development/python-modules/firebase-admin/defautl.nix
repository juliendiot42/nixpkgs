{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  astroid,
  pylint,
  pytest,
  pytest-cov,
  pytest-localserver,
  pytest-asyncio,
  pytest-mock,
  cachecontrol,
  google-api-core,
  google-api-python-client,
  google-cloud-firestore,
  google-cloud-storage,
  pyjwt,
}:
buildPythonPackage rec {
  pname = "firebase_admin";
  version = "6.5.0";

  # src = pkgs.fetchFromGitHub {
  #   owner = "firebase";
  #   repo = "firebase-admin-python";
  #   rev = "v6.5.0";
  #   hash = "sha256-Vrs5tSzRM8rX+ZpyxzQduqB2VKO1drqWqvtMtQf1b4A=";
  # };
  # pyproject = false;

  format = "wheel";
  src = fetchPypi rec {
    inherit pname version format;
    sha256 = "sha256-/jTuPKDmJcUVazkxyktLabX8NE2+UbupcG/2dM4neJg=";
    dist = python;
    python = "py3";
  };

  propagatedBuildInputs = [
    setuptools
    astroid
    pylint
    pytest
    pytest-cov
    pytest-localserver
    pytest-asyncio
    pytest-mock
    cachecontrol
    google-api-core
    google-api-python-client
    google-cloud-firestore
    google-cloud-storage
    pyjwt
  ];

  meta = with lib; {
    description = "The Firebase Admin Python SDK enables server-side (backend) Python developers to integrate Firebase into their services and applications.";
    homepage = "https://github.com/firebase/firebase-admin-python";
    changelog = "https://github.com/firebase/firebase-admin-python/releases";
    license = licenses.asl20;
    maintainers = with maintainers; [];
  };
}
