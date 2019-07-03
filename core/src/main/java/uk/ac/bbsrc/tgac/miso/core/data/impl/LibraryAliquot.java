/*
 * Copyright (c) 2012. The Genome Analysis Centre, Norwich, UK
 * MISO project contacts: Robert Davey @ TGAC
 * *********************************************************************
 *
 * This file is part of MISO.
 *
 * MISO is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * MISO is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with MISO. If not, see <http://www.gnu.org/licenses/>.
 *
 * *********************************************************************
 */

package uk.ac.bbsrc.tgac.miso.core.data.impl;

import static uk.ac.bbsrc.tgac.miso.core.util.LimsUtils.nullifyStringIfBlank;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.eaglegenomics.simlims.core.User;

import uk.ac.bbsrc.tgac.miso.core.data.AbstractBoxable;
import uk.ac.bbsrc.tgac.miso.core.data.Barcodable;
import uk.ac.bbsrc.tgac.miso.core.data.Box;
import uk.ac.bbsrc.tgac.miso.core.data.Boxable;
import uk.ac.bbsrc.tgac.miso.core.data.ChangeLog;
import uk.ac.bbsrc.tgac.miso.core.data.ChangeLoggable;
import uk.ac.bbsrc.tgac.miso.core.data.ConcentrationUnit;
import uk.ac.bbsrc.tgac.miso.core.data.Deletable;
import uk.ac.bbsrc.tgac.miso.core.data.Library;
import uk.ac.bbsrc.tgac.miso.core.data.Nameable;
import uk.ac.bbsrc.tgac.miso.core.data.Pool;
import uk.ac.bbsrc.tgac.miso.core.data.Timestamped;
import uk.ac.bbsrc.tgac.miso.core.data.VolumeUnit;
import uk.ac.bbsrc.tgac.miso.core.data.impl.boxposition.LibraryAliquotBoxPosition;
import uk.ac.bbsrc.tgac.miso.core.data.impl.changelog.LibraryAliquotChangeLog;
import uk.ac.bbsrc.tgac.miso.core.util.CoverageIgnore;
import uk.ac.bbsrc.tgac.miso.core.util.LimsUtils;

/**
 * uk.ac.bbsrc.tgac.miso.core.data.impl
 * <p/>
 * Info
 * 
 * @author Rob Davey
 * @since 0.0.2
 */
@Entity
@Table(name = "LibraryAliquot")
public class LibraryAliquot extends AbstractBoxable
    implements Barcodable, ChangeLoggable, Comparable<LibraryAliquot>, Nameable, Boxable, Deletable, Serializable, Timestamped {

  private static final long serialVersionUID = 1L;
  public static final Long UNSAVED_ID = 0L;

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long aliquotId = LibraryAliquot.UNSAVED_ID;

  @Column(nullable = false)
  private String name;
  @Column(nullable = false)
  @Temporal(TemporalType.DATE)
  private Date creationDate;

  @Column(name = "created", nullable = false, updatable = false)
  @Temporal(TemporalType.TIMESTAMP)
  private Date creationTime;

  private Double concentration;

  @Enumerated(EnumType.STRING)
  @Column(nullable = true)
  private ConcentrationUnit concentrationUnits;
  @Enumerated(EnumType.STRING)
  @Column(nullable = true)
  private VolumeUnit volumeUnits;

  @ManyToOne(targetEntity = UserImpl.class)
  @JoinColumn(name = "creator", nullable = false, updatable = false)
  private User creator;
  @ManyToOne(targetEntity = LibraryImpl.class)
  @JoinColumn(name = "libraryId")
  private Library library;

  @ManyToOne
  @JoinColumn(name = "targetedSequencingId")
  private TargetedSequencing targetedSequencing;

  @ManyToMany(targetEntity = PoolImpl.class)
  @JoinTable(name = "Pool_LibraryAliquot", joinColumns = { @JoinColumn(name = "aliquotId") }, inverseJoinColumns = {
      @JoinColumn(name = "poolId") })
  private Set<Pool> pools;

  @ManyToOne(targetEntity = UserImpl.class)
  @JoinColumn(name = "lastModifier")
  private User lastModifier;

  @Temporal(TemporalType.TIMESTAMP)
  private Date lastUpdated;

  private String identificationBarcode;

  @Column(updatable = false)
  private Long preMigrationId;

  @OneToOne(optional = true)
  @PrimaryKeyJoinColumn
  private LibraryAliquotBoxPosition boxPosition;

  private Double ngUsed;

  private Double volumeUsed;

  @OneToMany(targetEntity = LibraryAliquotChangeLog.class, mappedBy = "libraryAliquot", cascade = CascadeType.REMOVE)
  private final Collection<ChangeLog> changeLog = new ArrayList<>();

  @Override
  public Boxable.EntityType getEntityType() {
    return Boxable.EntityType.LIBRARY_ALIQUOT;
  }

  public Library getLibrary() {
    return library;
  }

  public void setLibrary(Library library) {
    this.library = library;
  }

  public TargetedSequencing getTargetedSequencing() {
    return targetedSequencing;
  }

  public void setTargetedSequencing(TargetedSequencing targetedSequencing) {
    this.targetedSequencing = targetedSequencing;
  }

  @Override
  public User getLastModifier() {
    return lastModifier;
  }

  @Override
  public void setLastModifier(User lastUpdated) {
    this.lastModifier = lastUpdated;
  }

  @Override
  public long getId() {
    return aliquotId;
  }

  @Override
  public void setId(long id) {
    this.aliquotId = id;
  }

  @Override
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  @Override
  public User getCreator() {
    return creator;
  }

  @Override
  public void setCreator(User creator) {
    this.creator = creator;
  }

  public Date getCreationDate() {
    return this.creationDate;
  }

  public void setCreationDate(Date creationDate) {
    this.creationDate = creationDate;
  }

  public Double getConcentration() {
    return this.concentration;
  }

  public void setConcentration(Double concentration) {
    this.concentration = concentration;
  }

  public ConcentrationUnit getConcentrationUnits() {
    return this.concentrationUnits;
  }

  public void setConcentrationUnits(ConcentrationUnit concentrationUnits) {
    this.concentrationUnits = concentrationUnits;
  }

  public VolumeUnit getVolumeUnits() {
    return this.volumeUnits;
  }

  public void setVolumeUnits(VolumeUnit volumeUnits) {
    this.volumeUnits = volumeUnits;
  }

  @Override
  public String getIdentificationBarcode() {
    return this.identificationBarcode;
  }

  @Override
  public void setIdentificationBarcode(String identificationBarcode) {
    this.identificationBarcode = nullifyStringIfBlank(identificationBarcode);
  }

  public Set<Pool> getPools() {
    return pools;
  }

  public void setPools(Set<Pool> pools) {
    this.pools = pools;
  }

  @Override
  @CoverageIgnore
  public String getLabelText() {
    return getLibrary().getAlias();
  }

  @Override
  public Long getPreMigrationId() {
    return preMigrationId;
  }

  public void setPreMigrationId(Long preMigrationId) {
    this.preMigrationId = preMigrationId;
  }

  @Override
  public String toString() {
    final StringBuilder sb = new StringBuilder();
    sb.append(getId());
    sb.append(" : ");
    sb.append(getName());
    sb.append(" : ");
    sb.append(getCreationDate());
    sb.append(" : ");
    sb.append(getConcentration());
    return sb.toString();
  }

  /**
   * Equivalency is based on getId() if set, otherwise on name, barcode, concentration, creation date, and creator userName.
   */
  @Override
  public boolean equals(Object obj) {
    if (obj == null) return false;
    if (obj == this) return true;
    if (!(obj instanceof LibraryAliquot)) return false;
    final LibraryAliquot them = (LibraryAliquot) obj;
    // If not saved, then compare resolved actual objects. Otherwise
    // just compare IDs.
    if (LibraryAliquot.UNSAVED_ID == getId() || LibraryAliquot.UNSAVED_ID == them.getId()) {
      if (name == null) {
        if (them.getName() != null)
          return false;
      } else if (!name.equals(them.getName())) {
        return false;
      }
      if (identificationBarcode == null) {
        if (them.getIdentificationBarcode() != null)
          return false;
      } else if (!identificationBarcode.equals(them.getIdentificationBarcode())) {
        return false;
      }
      if (concentration == null) {
        if (them.getConcentration() != null)
          return false;
      } else if (!concentration.equals(them.getConcentration())) {
        return false;
      }
      if (creationDate == null) {
        if (them.getCreationDate() != null)
          return false;
      } else if (!creationDate.equals(them.getCreationDate())) {
        return false;
      }
      if (creator == null) {
        if (them.getCreator() != null)
          return false;
      } else if (!creator.equals(them.getCreator())) {
        return false;
      }
      if (library == null) {
        if (them.getLibrary() != null)
          return false;
      } else if (!library.equals(them.getLibrary())) {
        return false;
      }
      if (targetedSequencing == null) {
        if (them.getTargetedSequencing() != null)
          return false;
      } else if (!targetedSequencing.equals(them.getTargetedSequencing())) {
        return false;
      }
      return true;
    } else {
      return getId() == them.getId();
    }
  }

  @CoverageIgnore
  @Override
  public int hashCode() {
    if (LibraryAliquot.UNSAVED_ID != getId()) {
      return (int) getId();
    } else {
      final int PRIME = 37;
      int hashcode = 1;
      if (getCreationDate() != null) hashcode = PRIME * hashcode + getCreationDate().hashCode();
      if (getCreator() != null) hashcode = PRIME * hashcode + getCreator().hashCode();
      if (getConcentration() != null) hashcode = PRIME * hashcode + getConcentration().hashCode();
      return hashcode;
    }
  }

  @Override
  public int compareTo(LibraryAliquot o) {
    if (getId() < o.getId()) return -1;
    if (getId() > o.getId()) return 1;
    return 0;
  }

  @Override
  public String getAlias() {
    return name;
  }

  @Override
  public Box getBox() {
    return boxPosition == null ? null : boxPosition.getBox();
  }

  @Override
  public String getBoxPosition() {
    return boxPosition == null ? null : boxPosition.getPosition();
  }

  public void setBoxPosition(LibraryAliquotBoxPosition boxPosition) {
    this.boxPosition = boxPosition;
  }

  @Override
  public void removeFromBox() {
    this.boxPosition = null;
  }

  @Override
  public Date getLastModified() {
    return lastUpdated;
  }

  @Override
  public void setLastModified(Date lastModified) {
    this.lastUpdated = lastModified;
  }

  @Override
  public String getLocationBarcode() {
    return identificationBarcode;
  }

  @Override
  public void setAlias(String alias) {
    name = alias;
  }

  @Override
  public Date getBarcodeDate() {
    return getCreationDate();
  }

  @Override
  public String getBarcodeExtraInfo() {
    return library.getName();
  }

  @Override
  public String getBarcodeSizeInfo() {
    return LimsUtils.makeVolumeAndConcentrationLabel(getVolume(), getConcentration(), getVolumeUnits(),
        getConcentrationUnits());
  }

  @Override
  public String getDeleteType() {
    return "Library Aliquot";
  }

  @Override
  public String getDeleteDescription() {
    return getName() + (getLibrary() == null || getLibrary().getAlias() == null ? "" : " (" + getLibrary().getAlias() + ")");
  }

  public Double getNgUsed() {
    return ngUsed;
  }

  public void setNgUsed(Double ngUsed) {
    this.ngUsed = ngUsed;
  }

  public Double getVolumeUsed() {
    return volumeUsed;
  }

  public void setVolumeUsed(Double volumeUsed) {
    this.volumeUsed = volumeUsed;
  }

  @Override
  public Date getCreationTime() {
    return creationTime;
  }

  @Override
  public void setCreationTime(Date creationTime) {
    this.creationTime = creationTime;
  }

  @Override
  public boolean isSaved() {
    return getId() != UNSAVED_ID;
  }

  @Override
  public Collection<ChangeLog> getChangeLog() {
    return changeLog;
  }

  @Override
  public ChangeLog createChangeLog(String summary, String columnsChanged, User user) {
    LibraryAliquotChangeLog change = new LibraryAliquotChangeLog();
    change.setLibraryAliquot(this);
    change.setSummary(summary);
    change.setColumnsChanged(columnsChanged);
    change.setUser(user);
    return change;
  }

}