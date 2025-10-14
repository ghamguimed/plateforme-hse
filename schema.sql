-- Utilisateurs & Services
CREATE TABLE service (
  id CHAR(36) PRIMARY KEY,
  nom VARCHAR(100) NOT NULL
);

CREATE TABLE utilisateur (
  id CHAR(36) PRIMARY KEY,
  nom VARCHAR(120) NOT NULL,
  email VARCHAR(160) UNIQUE NOT NULL,
  role ENUM('AUDITEUR','HSE','PM','ADMIN') NOT NULL,
  service_id CHAR(36) NULL,
  actif BOOLEAN NOT NULL DEFAULT TRUE,
  FOREIGN KEY (service_id) REFERENCES service(id)
);

-- Référentiels
CREATE TABLE standard_hse (
  id CHAR(36) PRIMARY KEY,
  code VARCHAR(20) NOT NULL,
  libelle VARCHAR(200) NOT NULL
);

-- Audits & Rapports
CREATE TABLE audit (
  id CHAR(36) PRIMARY KEY,
  code VARCHAR(40) UNIQUE NOT NULL,
  site VARCHAR(120) NOT NULL,
  zone VARCHAR(120) NOT NULL,
  date_audit DATE NOT NULL,
  statut ENUM('BROUILLON','EN_COURS','CLOTURE','VALIDE') NOT NULL DEFAULT 'BROUILLON',
  auditeur_id CHAR(36) NOT NULL,
  FOREIGN KEY (auditeur_id) REFERENCES utilisateur(id)
);

CREATE TABLE rapport (
  id CHAR(36) PRIMARY KEY,
  audit_id CHAR(36) UNIQUE NOT NULL,
  url_pdf VARCHAR(500) NOT NULL,
  genere_le DATETIME NOT NULL,
  FOREIGN KEY (audit_id) REFERENCES audit(id)
);

-- Anomalies
CREATE TABLE anomalie (
  id CHAR(36) PRIMARY KEY,
  audit_id CHAR(36) NOT NULL,
  titre VARCHAR(200) NOT NULL,
  description TEXT NOT NULL,
  standard_id CHAR(36) NULL,
  gravite ENUM('FAIBLE','MOYENNE','HAUTE','CRITIQUE') NOT NULL,
  statut ENUM('OUVERTE','EN_COURS','RESOLUE') NOT NULL DEFAULT 'OUVERTE',
  responsable_hse_id CHAR(36) NULL,
  due_date DATE NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (audit_id) REFERENCES audit(id),
  FOREIGN KEY (standard_id) REFERENCES standard_hse(id),
  FOREIGN KEY (responsable_hse_id) REFERENCES utilisateur(id)
);

-- Photos (constat ou résolution)
CREATE TABLE photo (
  id CHAR(36) PRIMARY KEY,
  audit_id CHAR(36) NULL,
  anomalie_id CHAR(36) NULL,
  url VARCHAR(500) NOT NULL,
  type ENUM('CONSTAT','RESOLUTION') NOT NULL,
  cree_le DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (audit_id) REFERENCES audit(id),
  FOREIGN KEY (anomalie_id) REFERENCES anomalie(id)
);

-- Commentaires
CREATE TABLE commentaire (
  id CHAR(36) PRIMARY KEY,
  anomalie_id CHAR(36) NOT NULL,
  auteur_id CHAR(36) NOT NULL,
  texte TEXT NOT NULL,
  cree_le DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (anomalie_id) REFERENCES anomalie(id),
  FOREIGN KEY (auteur_id) REFERENCES utilisateur(id)
);

-- Checklist (optionnel)
CREATE TABLE checklist_item (
  id CHAR(36) PRIMARY KEY,
  audit_id CHAR(36) NOT NULL,
  standard_id CHAR(36) NULL,
  intitule VARCHAR(200) NOT NULL,
  conforme BOOLEAN NOT NULL DEFAULT FALSE,
  remarque VARCHAR(500) NULL,
  FOREIGN KEY (audit_id) REFERENCES audit(id),
  FOREIGN KEY (standard_id) REFERENCES standard_hse(id)
);

-- Index utiles
CREATE INDEX idx_anomalie_responsable ON anomalie(responsable_hse_id, statut);
CREATE INDEX idx_anomalie_audit ON anomalie(audit_id, statut);
CREATE INDEX idx_photo_anomalie ON photo(anomalie_id);
CREATE INDEX idx_photo_audit ON photo(audit_id);
